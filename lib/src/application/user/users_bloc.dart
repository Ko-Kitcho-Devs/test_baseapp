
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/user/repositories/user_repository.dart';
import 'users_event.dart';
import 'users_state.dart';

// Bloc qui gère toute la logique CRUD Users et expose des states pour l'UI
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository repository; // repository injecté (implémentation fournie par GetIt)

  UsersBloc({ required this.repository }) : super(UsersInitial()) {
    // Liaison events -> handlers
    on<LoadUsers>(_onLoadUsers);
    on<CreateUserEvent>(_onCreateUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  // Handler pour LoadUsers
  Future<void> _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading()); // UI : afficher loader
    try {
      final users = await repository.getUsers(); // appel repository
      emit(UsersLoaded(users)); // émettre la liste reçue
    } catch (e) {
      emit(UsersError(e.toString())); // émettre message d'erreur
    }
  }

  // Handler pour création
  Future<void> _onCreateUser(CreateUserEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading()); // loading pendant la création
    try {
      await repository.createUser(firstName: event.firstName, lastName: event.lastName, email: event.email, password: event.password);
      add(LoadUsers()); // rafraîchir la liste après création
    } catch (e) {
      emit(UsersError(e.toString())); // erreur
    }
  }

  // Handler pour update
  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      await repository.updateUser(id: event.id, firstName: event.firstName, lastName: event.lastName, email: event.email, password: event.password);
      add(LoadUsers()); // reload
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  // Handler pour delete
  Future<void> _onDeleteUser(DeleteUserEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      await repository.deleteUser(event.id);
      add(LoadUsers());
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}
