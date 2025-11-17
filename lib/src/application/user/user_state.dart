import '../../domain/user/entities/user.dart';

abstract class UserState {}

class UserinitialState extends UserState{}

class UserLoadingState extends UserState{}

class UserLoadedState extends UserState{
  final User? user;
  UserLoadedState(this.user);
}

class UsersLoadedState extends UserState{
  final List<User> users;
  UsersLoadedState(this.users);
}

class UserSuccessState extends UserState{
  final String message;
  UserSuccessState(this.message);
}

class UserErrorState extends UserState{
  final String message;
  UserErrorState(this.message);
}