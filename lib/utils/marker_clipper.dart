import 'package:flutter/material.dart';
import 'package:place_project/utils/utils.dart';

class MarkerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Utils.getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
