import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/provider/app_repo.dart';
import 'package:place_project/provider/post_provider.dart';
import 'package:place_project/utils/utils.dart';
import 'package:place_project/widgets/button_widget.dart';
import 'package:place_project/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

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
          TextFieldWidget(
            hintText: "Message...",
            onChanged: (value) {
              context.read<PostProvider>().message = value;
            },
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
          GestureDetector(
            onTap: () =>
                context.read<PostProvider>().pickImage(ImageSource.gallery),
            child: Consumer<PostProvider>(
              builder: (context, value, child) {
                print(Utils.checkString(value.imgPath));
                return Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Utils.checkString(value.imgPath)
                      ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.file(
                                File(value.imgPath!),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                value.deleteImage();
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      : const Center(
                          child: Text(
                            "Upload from gallery",
                            style: AppTextStyles.body1,
                          ),
                        ),
                );
              },
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
            onPressed: () {
              context.read<PostProvider>().pickImage(ImageSource.camera);
            },
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
            onPressed: () {
              String token = context.read<AppRepo>().token;
              print(token);
              context
                  .read<PostProvider>()
                  .createPost(token)
                  .then((value) => Navigator.of(context).pop());
            },
            buttonName: "Create Post",
          )
        ],
      ),
    );
  }
}
