import 'dart:convert';

import 'package:http/http.dart' as http;

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
      request.headers['Authorization'] = 'Bearer $token';
    }
    return request.send();
  }
}
