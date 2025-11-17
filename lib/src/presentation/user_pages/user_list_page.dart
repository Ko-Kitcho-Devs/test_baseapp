import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../application/user/user_bloc.dart';
import '../../application/user/user_event.dart';
import '../../application/user/user_state.dart';
import '../../domain/user/entities/user.dart';
import './widgets/user_card.dart';
import 'user_detail_page.dart';
import 'user_form_page.dart';

@RoutePage()
class UserListPage extends StatefulWidget {
  static const String routeName = '/users';
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late final UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    
    _userBloc = sl<UserBloc>();
    
    _userBloc.add(GetAllUsersEvent());
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<UserBloc>.value(
      
      value: _userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                final result = await Navigator.push<User?>(
                  context,
                  MaterialPageRoute(builder: (_) => const UserFormPage()),
                );

                if (result != null) {
                  _userBloc.add(GetAllUsersEvent());
                }
              },
            )
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            
            if (state is UserLoadingState || state is UserinitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersLoadedState) {
              final List<User> users = state.users;
              if (users.isEmpty) {
                return const Center(child: Text('No users found.'));
              }
              return RefreshIndicator(
                onRefresh: () async {
                  _userBloc.add(GetAllUsersEvent());
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserCard(
                      user: user,
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserDetailPage(user: user),
                          ),
                        );
                      },
                      onDelete: () {
                        
                        _userBloc.add(DeleteUserEvent(user.id));
                      },
                    );
                  },
                ),
              );
            } else if (state is UserErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is UserLoadedState) {
              
              return Center(child: Text('Single user: ${state.user?.email ?? ''}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
