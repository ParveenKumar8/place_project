import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as parser;
import 'package:place_project/utils/extensions.dart';

abstract class ServiceBase<T> {
  Future<T> call();

  Uri _getAPI(String url) => Uri.parse(url);

  Future<Map<String, dynamic>> getRequest(
    String url, {
    String? token,
  }) async {
    try {
      final response = await MyRequest().get(_getAPI(url));
      return _handleResponse(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postRequest(
    String url, {
    Map<String, dynamic>? postParam,
    String? token,
  }) async {
    try {
      final response = await MyRequest(token).post(
        _getAPI(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(postParam),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> uploadImage(
      String apiUrl, String fieldName, String imgPath,
      {String? token}) async {
    try {
      final request = http.MultipartRequest(
        "POST",
        _getAPI(apiUrl),
      );
      if (token.checkStr()) {
        //request.headers['Authorization'] = 'Bearer $token';
        request.headers.addAll({"Authorization": "Bearer $token"});
      }
      request.files.add(await http.MultipartFile.fromPath(
        fieldName,
        imgPath,
        contentType: parser.MediaType('image', 'jpeg'),
      ));
      return _handleResponse(
        await http.Response.fromStream(
          await request.send(),
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //Todo
      throw Exception();
    }
  }
}

class MyRequest extends http.BaseClient {
  final String? token;

  /// In this constructor, we use optional positional parameters starts with []
  MyRequest([this.token]);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token != null) {
      //request.headers['Authorization'] = 'Bearer $token';
    }
    return request.send();
  }
}
