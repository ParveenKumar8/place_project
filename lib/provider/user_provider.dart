import 'package:flutter/material.dart';
import 'package:place_project/data/services/get_all_user_service.dart';
import 'package:place_project/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  Future<List<UserModel>> getUserLocationList() async {
    return await GetAllUserService().call();
  }
}
