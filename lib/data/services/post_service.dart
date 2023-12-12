import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/response/post_response.dart';
import 'package:place_project/data/services/service_base.dart';

class PostService extends ServiceBase<PostResponse> {
  @override
  Future<PostResponse> call() async {
    final response = await getRequest(AppConfig.posts);
    //print('*********');
    //print(response);
    return PostResponse.fromJson(response);
  }
}
