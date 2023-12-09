import 'package:flutter/material.dart';
import 'package:place_project/data/response/login_response.dart';
import 'package:place_project/data/services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  var username = "";
  var password = "";
  Future<LoginResponse> login() async {
    print('%%%%% $username $password');
    return LoginService("kminchelle", "0lelplR").call();
    //return LoginService(username = "kminchelle", password = "0lelplR").call();
  }

  //   final userName = email;
  //   final password = password1;
  //   UserModel? user;
  //   // final body = {
  //   //   "username": userName,
  //   //   "password": password,
  //   // };
  //   debugPrint("URL is ${AppURL.signIn}");
  //   debugPrint('UserName && Password is $userName $password');
  //   // final response = await http.post(
  //   //   Uri.parse(AppURL.signIn),
  //   //   body: jsonEncode(body),
  //   // );
  //   try {
  //     final response = await http.get(
  //       Uri.parse(AppURL.signIn),
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     final List bodyJson = jsonDecode(response.body);
  //     print(bodyJson[0]);

  //     if (response.statusCode == 200) {
  //       // To get list of object

  //       // List<UserModel> userList = bodyJson
  //       //     .map((user) => UserModel.fromJson(
  //       //           user,
  //       //         ))
  //       //     .toList();

  //       user = UserModel.fromJson(
  //         bodyJson[0],
  //       );
  //       print(user.email);
  //     } else {
  //       debugPrint("̀Error in webservice");

  //       throw Exception('Error');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user;
  // }
}
