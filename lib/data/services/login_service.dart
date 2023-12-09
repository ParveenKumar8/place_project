import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/response/login_response.dart';

class LoginService {
  final String username;
  final String password;

  LoginService(
    this.username,
    this.password,
  );

  Future<LoginResponse> call() async {
    print('LoginService -  $username $password');
    final response = await http.post(
      Uri.parse(AppConfig.signIn),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "username": username,
          "password": password,
        },
      ),
    );
    // final response = await http.post(
    //   Uri.parse(AppConfig.signIn),
    // );
    final bodyResponse = jsonDecode(response.body);
    print('LoginService -  $bodyResponse');
    return LoginResponse.fromJson(bodyResponse);
  }
}
