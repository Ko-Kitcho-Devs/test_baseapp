import '../../domain/user/entities/user.dart';
import '../../domain/user/repositories/user_repository.dart';
import './data_source/user_remote_data_source.dart';
import './dtos/user_dto.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> createUser(User user) async {
    final userDto = await remoteDataSource.createUser(
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      password: user.password,
    );
    return userDto.toDomain();
  }

  @override
  Future<List<User>> getAllUsers() async {
    final userDtos = await remoteDataSource.getAllUsers();
    return userDtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<User?> getUserById(String id) async {
    final userDto = await remoteDataSource.getUserById(id);
    return userDto?.toDomain();
  }

  @override
  Future<User> updateUser(User user) async {
    final userDto = await remoteDataSource.updateUser(
      id: user.id.toString(),
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      password: user.password,
    );
    return userDto.toDomain();
  }

  @override
  Future<void> deleteUser(String? id) async {
    await remoteDataSource.deleteUser(id);
  }
}
