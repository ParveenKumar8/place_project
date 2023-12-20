import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/services/service_base.dart';
import 'package:place_project/models/user_model.dart';

class GetAllUserService extends ServiceBase<List<UserModel>> {
  @override
  Future<List<UserModel>> call() async {
    final response = await getRequest(AppConfig.getUsersLocation);
    final json = response['users'];
    print('json length ${json.length}');
    return List.generate(
      json.length,
      (index) => UserModel.fromJson(json[index]),
    );
  }
}
