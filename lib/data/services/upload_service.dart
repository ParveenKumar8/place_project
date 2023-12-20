import 'package:place_project/config/app_config.dart';
import 'package:place_project/data/services/service_base.dart';

class UploadService extends ServiceBase<String> {
  final String imgPath;

  UploadService(
    this.imgPath,
  );

  @override
  Future<String> call() async {
    final response =
        await uploadImage(AppConfig.uploadPostImg, "photo", imgPath);
    return response['data']['url'];
  }
}
