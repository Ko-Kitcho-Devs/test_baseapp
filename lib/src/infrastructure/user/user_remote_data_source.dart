
import 'package:dio/dio.dart';
import 'models/user_model.dart';

// class qui centralise les appels HTTP pour users
class UserRemoteDataSource {
  final Dio client; // Dio client injecté 
  // Constructeur avec Dio injecté
  UserRemoteDataSource({ required this.client });

  // Récupère la liste d'utilisateurs : GET /api/users
  Future<List<UserModel>> getUsers() async {
    final response = await client.get('/users'); 
    // response.data est  une List dynamique
    final data = response.data as List<dynamic>;   
    // transforme chaque élément JSON en UserModel
    return data.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  // Créer un utilisateur : POST /api/users
  Future<UserModel> createUser({ required String firstName, required String lastName, required String email, required String password }) async {
    final body = {
      'first_name': firstName, // format attendu par  l'API
      'last_name': lastName,
      'email': email,
      'password': password,
    };
    final response = await client.post('/register', data: body); 
    // renvoie le DTO construit depuis la réponse
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  // Met à jour un utilisateur : PUT /api/users/{id}
  Future<UserModel> updateUser({ required String id, required String firstName, required String lastName, required String email, String? password }) async {
    final body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      if (password != null) 'password': password, // ajoute password que si fournie
    };
    final response = await client.put('/update/$id', data: body); 
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  // Supprime un utilisateur : DELETE /api/users/{id}
  Future<void> deleteUser(String id) async {
    await client.delete('/delete/$id');
  }
}
