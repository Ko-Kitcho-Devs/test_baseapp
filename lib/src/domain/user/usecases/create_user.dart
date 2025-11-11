

import '../../../domain/user/repositories/user_repository.dart';
import '../../../../../src/domain/user/entities/user.dart'; 

/// UseCase : création d'un utilisateur
/// centraliser la logique métier de création (validation + appel repo)
class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  // call retourne l'utilisateur créé (ou lève une exception)
  Future<User> call({ required String firstName, required String lastName, required String email, required String password }) {
    
    return repository.createUser(firstName: firstName, lastName: lastName, email: email, password: password);
  }
}
