import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../application/user/user_bloc.dart';
import '../../application/user/user_event.dart';
import '../../application/user/user_state.dart';
import '../../domain/user/entities/user.dart';

@RoutePage()
class UserFormPage extends StatefulWidget {
  static const String routeName = '/userform';
  final User? user;
  const UserFormPage({super.key, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    
    _firstNameController = TextEditingController(text: widget.user?.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.user?.lastName ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _passwordController = TextEditingController(text: widget.user?.password ?? '');
    
    _userBloc = sl<UserBloc>();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userBloc.close(); 
    super.dispose();
  }

  void _submit() {
    
    if (!_formKey.currentState!.validate()) return;

    if (widget.user == null) {
      
      _userBloc.add(CreateUserEvent(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ));
    } else {
      
      _userBloc.add(UpdateUserEvent(
        id: widget.user!.id,
        firstName: _firstNameController.text.isEmpty ? null : _firstNameController.text.trim(),
        lastName: _lastNameController.text.isEmpty ? null : _lastNameController.text.trim(),
        email: _emailController.text.isEmpty ? null : _emailController.text.trim(),
        password: _passwordController.text.isEmpty ? null : _passwordController.text.trim(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<UserBloc>.value(
      value: _userBloc,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.user == null ? 'Create User' : 'Update User')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(labelText: 'First name'),
                        validator: (v) => (v == null || v.isEmpty) ? 'First name required' : null,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(labelText: 'Last name'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Last name required' : null,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Email required' : null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (v) {
                          
                          if (widget.user == null && (v == null || v.isEmpty)) {
                            return 'Password required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocListener<UserBloc, UserState>(
                        listener: (context, state) {
                          
                          if (state is UserSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                            Navigator.pop(context, state); 
                          } else if (state is UserErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: Text(widget.user == null ? 'Create' : 'Update'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
