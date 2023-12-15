import 'package:place_project/models/user_model.dart';

class ChatModel {
  final String message;
  final UserModel user;

  ChatModel(this.message, this.user);

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      json['message'],
      UserModel.fromJson(
        json['user'],
      ),
    );
  }
}
