import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:place_project/data/services/create_post_service.dart';
import 'package:place_project/data/services/post_service.dart';
import 'package:place_project/data/services/upload_service.dart';
import 'package:place_project/models/post_model.dart';
import 'package:place_project/utils/utils.dart';

class PostProvider extends ChangeNotifier {
  final List<PostModel> postList = [];
  String message = "";
  String? imgPath = "";

  Future<void> getPostRequest() async {
    print("Calling getPost()");
    postList.clear();
    final postResponse = await PostService().call();
    postList.addAll(postResponse.postList!);
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    String? img;
    if (imgPath != null) {
      img = await uploadImg();
    }
    await CreatePostService(message, img, token).call();
    message = "";
    imgPath = null;
    print("Calling createPost() after call");
    getPostRequest();
  }

  Future<String> uploadImg() async {
    if (Utils.checkString(imgPath)) {
      return await UploadService(imgPath!).call();
    }
    throw Exception();
  }

  void pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      //imgPath = path;
      final croppedPath = await Utils.cropImage(path);
      imgPath = croppedPath?.path ?? "";
      notifyListeners();
      print(path);
    } catch (e) {
      print(e);
    }
  }

  void deleteImage() {
    imgPath = "";
    notifyListeners();
  }
}
