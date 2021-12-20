import 'package:dio/dio.dart';
import 'package:preguntasapp/services/base_url.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    try {
      var dio = Dio();
      var res = await dio.post(
        '$baseUrl/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        var token = res.data['token'];
        return token;
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  Future<String> register(String name, String email, String password) async {
    try {
      var dio = Dio();
      var res = await dio.post(
        '$baseUrl/api/login/new',
        data: {
          'nombre': name,
          'email': email,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        var token = res.data['token'];
        return token;
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}
