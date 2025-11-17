
import '../entities/user.dart';
import '../repositories/user_repository.dart';


class createUser {
  final IUserRepository repository;

  createUser(this.repository);

  Future<User> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final user = User(
      id: '',
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    return repository.createUser(user);
  
  }
}