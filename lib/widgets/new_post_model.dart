import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/widgets/button_widget.dart';
import 'package:place_project/widgets/text_field_widget.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(24.0),
          right: Radius.circular(24.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Insert Message",
            style: AppTextStyles.header3,
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextFieldWidget(
            hintText: "Message...",
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Add Image",
            style: AppTextStyles.header3,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.white),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Center(
              child: Text(
                "Upload from gallery",
                style: AppTextStyles.body1,
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "OR",
            style: AppTextStyles.body1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Camera",
              style: AppTextStyles.body2.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ButtonWidget(
            onPressed: () {},
            buttonName: "Create Post",
          )
        ],
      ),
    );
  }
}
