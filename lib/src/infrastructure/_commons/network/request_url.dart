import 'env_config.dart';

class RequestUrl {
  String baseUrl = EnvManager().getBaseUrl();
  String get apiUrl => '$baseUrl/api';
  String get imageBaseUrl => baseUrl;
}
