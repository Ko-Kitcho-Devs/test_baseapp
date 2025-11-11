

import '../../../domain/user/repositories/user_repository.dart'; 
import '../../../domain/user/entities/user.dart'; 

/// UseCase : obtenir la liste des utilisateurs.
///action métier "récupérer les users"

class GetUsers {
  final UserRepository repository; // repository injecté 

  // Injection du repository via le constructeur
  GetUsers(this.repository);

  // Exécution du usecase : délègue au repository
  Future<List<User>> call() {
    return repository.getUsers(); // retourne la liste d'utilisateurs 
  }
}
