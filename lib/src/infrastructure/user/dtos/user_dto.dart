import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/user/entities/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) = _UserDto;

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      password: user.password,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoX on UserDto {
  User toDomain() {
    return User(
      id: id,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      password: password ?? '',
    );
  }

}