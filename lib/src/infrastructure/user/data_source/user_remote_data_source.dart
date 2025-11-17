import 'package:dio/dio.dart';

import '../../_commons/exceptions.dart';
import '../../_commons/network/app_http_service.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';
import '../dtos/user_dto.dart';

abstract class IUserRemoteDataSource {
  Future<UserDto> createUser({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
  });
  Future<List<UserDto>> getAllUsers();

  Future<UserDto?> getUserById(String id);

  Future<UserDto> updateUser({
    required String id,
     String? firstName,
     String? lastName,
     String? email,
     String? password,
  });
  Future<void> deleteUser(String? id);

}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final IAppRequests httpClient;

  UserRemoteDataSource({required this.httpClient});

  @override
  Future<UserDto> createUser({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
  }) async {
    final String request = '${AppHttpService.baseUrl}/api/register/';
    final body = {
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    };
    final Response response =
        await httpClient.postRequest(request, body: body);
    return _performResponse(response);
  }

  @override
  Future<List<UserDto>> getAllUsers() async {
    final String request = '${AppHttpService.baseUrl}/api/users/';
    final Response response = await httpClient.getRequest(request);
    return _performResponse(response);
  }

  @override
  Future<UserDto?> getUserById(String id) async {
    final String request = '${AppHttpService.baseUrl}/api/user/$id/';
    final Response response = await httpClient.getRequest(request);
    return _performResponse(response);
  }
  @override
  Future<UserDto> updateUser({
    required String id,
     String? firstName,
     String? lastName,
     String? email,
     String? password,
  }) async { 
    final String request = '${AppHttpService.baseUrl}/api/update/$id/';
    final body = {
  if (firstName != null) 'first_name': firstName,
  if (lastName != null) 'last_name': lastName,
  if (email != null) 'email': email,
  if (password != null) 'password': password,
};
    final Response response =
        await httpClient.putRequest(request, body: body);
    return _performResponse(response);
  }
  @override
  Future<void> deleteUser(String? id) async {
    final String request = '${AppHttpService.baseUrl}/api/delete/$id/';
    final Response response = await httpClient.deleteRequest(request);
    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    } else {
      throw ServerException(errorThrow(response));
    }
  }

  dynamic _performResponse(Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {

      if (response.data is List) {
        return (response.data as List)
            .map((json) => UserDto.fromJson( json as Map<String, dynamic> ))
            .toList();
      } 
      else if (response.data is Map<String, dynamic>) {

        return UserDto.fromJson(response.data);

    } 
    throw Exception('Format de réponse inattendu : ${response.data.runtimeType}');
  } else {
      throw Exception(
      'Erreur serveur : ${response.statusCode} → ${response.data}');

    }
  }
  
  }
  