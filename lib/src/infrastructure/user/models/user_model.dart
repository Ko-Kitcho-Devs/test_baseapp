

import '../../../domain/user/entities/user.dart'; 

// UserModel = représentation côté API (types identiques au JSON)
class UserModel {
  final int id;              
  final String firstName;    
  final String lastName;     
  final String email;        
  final String? password;    // password optionnel

  // Constructeur
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
  });

  // Factory: JSON -> UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,                             
      firstName: json['first_name'] as String,           
      lastName: json['last_name'] as String,             
      email: json['email'] as String,                    
      // password optionnel
      password: json.containsKey('password') ? json['password'] as String : null,
    );
  }

  // transforme DTO -> entité Domain
  User toDomain() {
    return User(
      id: id.toString(),           
      firstName: firstName,
      lastName: lastName,
      email: email,
      
      password: password,
    );
  }

  // transformation Domain -> JSON 
  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    if (password != null) 'password': password,
  };
}
