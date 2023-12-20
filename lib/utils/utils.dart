import 'dart:math';
import 'dart:ui';

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

  static Path getPath(Size size) {
    final path = Path();
    //path.moveTo(0, 0);
    path.moveTo(size.width / 2, size.height);
    //path.lineTo(0, size.height / 2);

    path.quadraticBezierTo(
      -1,
      (size.height / 2) + 12,
      0,
      size.height / 2,
    );
    path.addArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      pi,
      pi,
    );
    //path.lineTo(size.width / 2, size.height);
    path.quadraticBezierTo(
      size.width + 1,
      (size.height / 2) + 12,
      size.width / 2,
      size.height,
    );
    return path;
  }

  // /// Check String whether it is null or not
  // static bool checkString(String? str) {
  //   // false is null or empty , true it has data
  //   return str?.isNotEmpty ?? false;
  // }
}
