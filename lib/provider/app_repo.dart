import 'package:flutter/material.dart';
import 'package:place_project/models/user_model.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? _user;

  set user(UserModel? value) => _user = value;

  UserModel get user => _user!;

  set token(String? value) => _token = value;
  String get token => _token ?? "";
}
