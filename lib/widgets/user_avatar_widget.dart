import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final double imgSize;
  final String userImg;
  const UserAvatarWidget({
    super.key,
    required this.userImg,
    this.imgSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.white.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          userImg,
          width: imgSize,
          height: imgSize,
        ),
      ),
    );
  }
}
