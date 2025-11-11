

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/user/entities/user.dart';
import '../../application/user/users_bloc.dart';
import '../../application/user/users_event.dart';

class UserFormPage extends StatefulWidget {
  final User? user; 
  const UserFormPage({Key? key, this.user}) : super(key: key);

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>(); // clé formulaire
  late TextEditingController _firstNameController; // controller prénom
  late TextEditingController _lastNameController; // controller nom
  late TextEditingController _emailController; // controller email
  late TextEditingController _passwordController; // controller password

  @override
  void initState() {
    super.initState();
    
    _firstNameController = TextEditingController(text: widget.user?.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.user?.lastName ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _passwordController = TextEditingController(); // vide par défaut
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return; // validation simple
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (widget.user == null) {
      // création
      context.read<UsersBloc>().add(CreateUserEvent(firstName: firstName, lastName: lastName, email: email, password: password));
    } else {
      // mise à jour que password que si non vide
      context.read<UsersBloc>().add(UpdateUserEvent(id: widget.user!.id, firstName: firstName, lastName: lastName, email: email, password: password.isEmpty ? null : password));
    }

    // Fermer la page
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Modifier utilisateur' : 'Créer utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // associée au FormState
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: isEdit ? 'Nouveau mot de passe (laisser vide si inchangé)' : 'Mot de passe'),
                obscureText: true,
                validator: (v) {
                
                  if (!isEdit && (v == null || v.trim().isEmpty)) return 'Champ requis';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
