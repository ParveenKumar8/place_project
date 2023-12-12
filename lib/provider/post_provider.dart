import 'package:flutter/material.dart';
import 'package:place_project/data/services/post_service.dart';
import 'package:place_project/models/post_model.dart';

class PostProvider extends ChangeNotifier {
  final List<PostModel> postList = [];

  Future<void> getPostRequest() async {
    postList.clear();
    final postResponse = await PostService().call();
    postList.addAll(postResponse.postList!);
    notifyListeners();
  }

  Future<void> createPost() async {}
}
