

abstract class UserEvent{}

class CreateUserEvent extends UserEvent{
final String firstName;
final String lastName;
final String email;
final String password;

CreateUserEvent({
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.password,
});
}

class GetAllUsersEvent extends UserEvent{}

class GetUserByIdEvent extends UserEvent{
  final String id;

  GetUserByIdEvent(this.id);
}

class UpdateUserEvent extends UserEvent{
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  UpdateUserEvent(
      { required this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
  }
  );
}

class DeleteUserEvent extends UserEvent{
  final String? id;

  DeleteUserEvent(this.id);
}
