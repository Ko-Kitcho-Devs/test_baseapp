import '../repositories/user_repository.dart';


class deleteUser {
  final IUserRepository repository;

  deleteUser(this.repository);

  Future<void> call({required String id}) async {
    return repository.deleteUser(id);
  }
}