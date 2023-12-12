import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/response/login_response.dart';
import 'package:place_project/data/services/service_base.dart';

class LoginService extends ServiceBase<LoginResponse> {
  final String username;
  final String password;

  LoginService(
    this.username,
    this.password,
  );

  @override
  Future<LoginResponse> call() async {
    print('LoginService -  $username $password');
    final postParam = {
      "username": username,
      "password": password,
    };
    final response = await postRequest(
      AppConfig.signIn,
      postParam: postParam,
    );
    //print('LoginService -  $response');
    return LoginResponse.fromJson(response);
  }
}
