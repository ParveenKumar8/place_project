import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/services/service_base.dart';

class CreatePostService extends ServiceBase<void> {
  final String message;
  final String? img;
  final String token;

  CreatePostService(this.message, this.img, this.token);

  @override
  Future<void> call() async {
    final body = {
      "title": message,
      "userId": 5,
    };
    if (img != null) {
      body['img'] = img!;
    }
    print(body);
    final response = await postRequest(
      AppConfig.createPosts,
      postParam: body,
      token: token,
    );
    print(response);
  }
}
