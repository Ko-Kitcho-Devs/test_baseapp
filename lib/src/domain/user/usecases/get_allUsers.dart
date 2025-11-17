import '../entities/user.dart';
import '../repositories/user_repository.dart';

class getAllUsers {
  final IUserRepository repository;

  getAllUsers(this.repository);

  Future<List<User>> call() async {
    return repository.getAllUsers();
  }
}