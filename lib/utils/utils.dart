import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  /// Function used to select image from gallery or camera
  static Future<String> pickImage(ImageSource src) async {
    try {
      final imgPicker = ImagePicker();
      final img = await imgPicker.pickImage(source: src);
      return img?.path ?? "";
    } catch (e) {
      return "";
    }
  }

  /// Function used to crop image from gallery or camera
  static Future<CroppedFile?> cropImage(String path) async {
    try {
      final result = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      );
      return result;
    } catch (e) {
      return null;
    }
  }

  /// Check String whether it is null or not
  static bool checkString(String? str) {
    // false is null or empty , true it has data
    return str?.isNotEmpty ?? false;
  }
}
