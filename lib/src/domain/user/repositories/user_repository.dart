

import '../entities/user.dart';

// Interface / contrat : ce que le domaine attend d'un UserRepository
abstract class UserRepository {
  // Récupère la liste d'utilisateurs depuis la source (remote/local)
  Future<List<User>> getUsers();

  // Créer un utilisateur et renvoie l'utilisateur créé
  Future<User> createUser({ required String firstName, required String lastName, required String email, required String password });

  // Met à jour un utilisateur et renvoie l'utilisateur mis à jour
  Future<User> updateUser({ required String id, required String firstName, required String lastName, required String email, String? password });

  // Supprime un utilisateur (retourne void si succès)
  Future<void> deleteUser(String id);
}
