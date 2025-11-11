

import 'package:dio/dio.dart';

import '../../domain/user/entities/user.dart'; 
import '../../domain/user/repositories/user_repository.dart';
import 'user_remote_data_source.dart'; 

// Implémentation concrète du UserRepository
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote; // dépendance réseau injectée

  UserRepositoryImpl({ required this.remote });

  @override
  Future<List<User>> getUsers() async {
    try {
      // Récupère les models depuis remote
      final models = await remote.getUsers();
      // transforme models -> entités domain
      return models.map((m) => m.toDomain()).toList();
    } on DioException catch (e) { // capture erreurs réseau Dio
      // Relever l'erreur pour caller
      throw Exception('Erreur réseau: ${e.message}');
    } catch (e) {
      // Erreur imprévue
      throw Exception('Erreur inconnue: $e');
    }
  }

  @override
  Future<User> createUser({ required String firstName, required String lastName, required String email, required String password }) async {
    try {
      final model = await remote.createUser(firstName: firstName, lastName: lastName, email: email, password: password);
      return model.toDomain();
    } on DioException catch (e) {
      throw Exception('Impossible de créer l\'utilisateur : ${e.message}');
    } catch (e) {
      throw Exception('Erreur inconnue lors de la création : $e');
    }
  }

  @override
  Future<User> updateUser({ required String id, required String firstName, required String lastName, required String email, String? password }) async {
    try {
      final model = await remote.updateUser(id: id, firstName: firstName, lastName: lastName, email: email, password: password);
      return model.toDomain();
    } on DioException catch (e) {
      throw Exception('Impossible de mettre à jour : ${e.message}');
    } catch (e) {
      throw Exception('Erreur inconnue lors de la mise à jour : $e');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await remote.deleteUser(id);
      return;
    } on DioException catch (e) {
      throw Exception('Impossible de supprimer : ${e.message}');
    } catch (e) {
      throw Exception('Erreur inconnue lors de la suppression : $e');
    }
  }
}
