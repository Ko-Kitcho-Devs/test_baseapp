import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateUser {
  final IUserRepository repository;

  UpdateUser(this.repository);

  Future<User> call({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) async {
    // Ici on crée un User "partiel" pour l’update
    // Les champs non modifiés restent null
    final user = User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    return repository.updateUser(user);
  }
}
