

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/user/users_bloc.dart';
import '../../application/user/users_event.dart';
import '../../application/user/users_state.dart';
import '../../domain/user/entities/user.dart';
import 'user_form_page.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Utilisateurs')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Ouvre la page du formulaire en mode création
          await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const UserFormPage()));
          // Après retour, on recharge la liste
          context.read<UsersBloc>().add(LoadUsers());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersInitial) {
            // Au premier rendu, on lance le chargement
            context.read<UsersBloc>().add(LoadUsers());
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoaded) {
            final users = state.users;
            if (users.isEmpty) {
              return const Center(child: Text('Aucun utilisateur'));
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final u = users[index];
                return ListTile(
                  title: Text('${u.firstName} ${u.lastName}'), 
                  subtitle: Text(u.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          // ouvrre le formulaire en mode édition en passant l'utilisateur
                          await Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserFormPage(user: u)));
                          
                          context.read<UsersBloc>().add(LoadUsers());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // lancer suppression via event
                          context.read<UsersBloc>().add(DeleteUserEvent(id: u.id));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UsersError) {
            return Center(child: Text('Erreur : ${state.message}')); 
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
