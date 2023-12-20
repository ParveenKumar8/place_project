import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/utils/utils.dart';

class MarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    // Offset c = const Offset(0, 0);
    // canvas.drawCircle(c, 20.0, paint);

    canvas.drawPath(Utils.getPath(size), paint);
    canvas.drawShadow(
      Utils.getPath(size),
      AppColors.blackColor.withOpacity(0.87),
      6,
      false,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
