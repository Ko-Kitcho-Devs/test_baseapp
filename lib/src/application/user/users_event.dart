

// Base class pour les events du UsersBloc
abstract class UsersEvent {}

// Charger la liste
class LoadUsers extends UsersEvent {}

// Créer un utilisateur
class CreateUserEvent extends UsersEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  CreateUserEvent({ required this.firstName, required this.lastName, required this.email, required this.password });
}

// Mettre à jour un utilisateur
class UpdateUserEvent extends UsersEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? password;

  UpdateUserEvent({ required this.id, required this.firstName, required this.lastName, required this.email, this.password });
}

// Supprimer un utilisateur
class DeleteUserEvent extends UsersEvent {
  final String id;
  DeleteUserEvent({ required this.id });
}
