import '../entities/user.dart';
import '../repositories/user_repository.dart';

class getUserById {
  final IUserRepository repository;

  getUserById(this.repository);

  Future<User?> call({required String id}) async {
    return repository.getUserById(id);
  }
}