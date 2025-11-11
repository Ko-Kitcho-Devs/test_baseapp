

import '../../../domain/user/repositories/user_repository.dart';
import '../../../../../src/domain/user/entities/user.dart'; 

/// UseCase : mise à jour d'un utilisateur
class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<User> call({ required String id, required String firstName, required String lastName, required String email, String? password }) {
    
    return repository.updateUser(id: id, firstName: firstName, lastName: lastName, email: email, password: password);
  }
}
