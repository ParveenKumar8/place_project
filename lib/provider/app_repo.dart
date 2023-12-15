import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:place_project/models/chat_model.dart';
import 'package:place_project/models/user_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? _user;
  WebSocketChannel? _wsChannel;
  List<ChatModel> chatList = [];

  set user(UserModel? value) => _user = value;

  UserModel get user => _user!;

  set token(String? value) {
    _token = value;
    //_connectSocket();
    // Just to insert dummy data bcz we don't have socket.io url
    final msgJson = {
      "message":
          "Hello everyone, How are you ??? Are you still reading this message. Hello everyone, How are you ??? Are you still reading this message. Hello everyone, How are you ??? Are you still reading this message.",
      "user": {
        "id": 15,
        "username": "Armaan",
        "image": "https://picsum.photos/id/22/200/300"
      },
    };
    _addChatInList(msgJson);
    final msgJson1 = {
      "message":
          "Hello everyone, How are you ??? Are you still reading this message. ",
      "user": {
        "id": 1,
        "username": "Parveen",
        "image": "https://picsum.photos/id/22/200/300"
      },
    };
    _addChatInList(msgJson1);
  }

  String get token => _token ?? "";

  _connectSocket() {
    try {
      final wsUrl = Uri.parse("ws://localhost:8080/ws?token=$_token");
      _wsChannel = WebSocketChannel.connect(wsUrl);
      _wsChannel?.stream.listen((msgJson) {
        _addChatInList(msgJson);
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  _addChatInList(Map<String, dynamic> msgJson) {
    chatList.add(
      ChatModel.fromJson(
        msgJson,
      ),
    );
    notifyListeners();
  }
}
