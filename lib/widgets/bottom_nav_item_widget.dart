import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/widgets/bottom_nav_bar.dart';

class BottomNavItemWidget extends StatelessWidget {
  final Function()? onPressed;
  final BottomNavOptions currentIndex;
  final BottomNavOptions nameIndex;
  final String icon;

  const BottomNavItemWidget({
    Key? key,
    required this.onPressed,
    required this.currentIndex,
    required this.nameIndex,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        width: 24.0,
        height: 24.0,
        colorFilter: ColorFilter.mode(
          currentIndex == nameIndex
              ? AppColors.blackColor
              : AppColors.blackColor.withOpacity(0.3),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
