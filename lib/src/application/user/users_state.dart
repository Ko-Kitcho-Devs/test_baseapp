
import '../../domain/user/entities/user.dart';

// États du UsersBloc
abstract class UsersState {}

// état initial
class UsersInitial extends UsersState {}

// en chargement
class UsersLoading extends UsersState {}

// chargé avec liste d'utilisateurs
class UsersLoaded extends UsersState {
  final List<User> users;
  UsersLoaded(this.users);
}

// erreur avec message affichable
class UsersError extends UsersState {
  final String message;
  UsersError(this.message);
}
