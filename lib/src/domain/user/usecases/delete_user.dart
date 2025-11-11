

import '../../../domain/user/repositories/user_repository.dart';

/// UseCase : suppression d'un utilisateur
class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<void> call(String id) {
    return repository.deleteUser(id);
  }
}
