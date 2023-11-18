import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool? isPassword;
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: const TextStyle(
          color: AppColors.blackColor,
        ),
        fillColor: AppColors.backgroundInput,
        filled: true,
        labelText: hintText ?? "",
        labelStyle: const TextStyle(
          color: AppColors.whiteColor,
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide.none,
        ),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(12.0),
        //   ),
        // ),
      ),
      obscureText: isPassword ?? false,
    );
  }
}
