import 'package:flutter/material.dart';
import 'package:place_project/data/services/create_post_service.dart';
import 'package:place_project/data/services/post_service.dart';
import 'package:place_project/models/post_model.dart';

class PostProvider extends ChangeNotifier {
  final List<PostModel> postList = [];
  String message = "";

  Future<void> getPostRequest() async {
    print("Calling getPost()");
    postList.clear();
    final postResponse = await PostService().call();
    postList.addAll(postResponse.postList!);
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(message, null, token).call();
    message = "";
    print("Calling createPost() after call");
    getPostRequest();
  }
}
