import '../entities/user.dart';

abstract class IUserRepository {
  Future <User> createUser(User user);
  Future <List<User>> getAllUsers();
  Future <User?> getUserById(String id);
  Future <User> updateUser(User user);
  Future <void> deleteUser(String? id);
}
