import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function()? onPressed;
  final double? buttonWidth;
  final Color? bgColor;
  final bool? isSocialBtn;
  final String? btnImg;
  const ButtonWidget({
    super.key,
    required this.buttonName,
    this.onPressed,
    this.buttonWidth,
    this.bgColor,
    this.isSocialBtn,
    this.btnImg,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final btnWidth = screenWidth * (buttonWidth ?? 0.85);
    final isSocial = isSocialBtn ?? false;
    final btnIcon = btnImg ?? "";
    print('Screen Width $screenWidth , btnImg : $btnImg');
    return SizedBox(
      width: btnWidth,
      height: 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: bgColor ?? Colors.amber,
          shape: isSocial
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
        ),
        onPressed: onPressed ?? () {},
        child: !isSocial
            ? Text(
                buttonName,
                style: AppTextStyles.subTitle2,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isSocial
                      ? Image.asset(
                          btnIcon,
                          width: 22,
                          height: 22,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    buttonName,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
