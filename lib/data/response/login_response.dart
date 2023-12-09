import 'package:place_project/models/user_model.dart';

class LoginResponse {
  final UserModel user;
  final String token;

  LoginResponse(this.user, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      UserModel.fromJson(json),
      json['token'],
    );
    // return LoginResponse(
    //   user: UserModel.fromJson(json),
    //   token: json['token'] ?? "47434723843wfhhhhrrrerwe",
    // );
  }
}
