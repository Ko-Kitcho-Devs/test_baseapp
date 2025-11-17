import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/user/entities/user.dart';
import '../../domain/user/repositories/user_repository.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final IUserRepository repository;

  UserBloc({
    required this.repository,
  }) :super(UserinitialState()){
    on<CreateUserEvent>(_onCreateUserEvent);
    on<GetAllUsersEvent>(_onGetAllUsersEven);
    on<GetUserByIdEvent>(_onGetUserByIdEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<DeleteUserEvent>(_onDeleteUserEvent);
}

Future<void> _onGetAllUsersEven(GetAllUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final users = await repository.getAllUsers(); 
      emit(UsersLoadedState(users)); 
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onGetUserByIdEvent(GetUserByIdEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {

      final user = await repository.getUserById(event.id); 
      emit(UserLoadedState(user)); 
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onCreateUserEvent(CreateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final user= User(
        firstName: event.firstName.trim(),
        lastName: event.lastName.trim(),
        email: event.email.trim(),
        password: event.password.trim(),);
      await repository.createUser(user);
      add(GetAllUsersEvent()); 
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onUpdateUserEvent(UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {

      final user= User(
        id: event.id,
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,);
      await repository.updateUser(user);
      add(GetAllUsersEvent());
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onDeleteUserEvent(DeleteUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      await repository.deleteUser(event.id);
      add(GetAllUsersEvent());
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
  }