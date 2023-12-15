import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/chat_model.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

// This chat widget will be display the user message received by him/her from others.
class ChatReceiverWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatReceiverWidget({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 10.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UserAvatarWidget(
            userImg: AppImages.imgCoverWomen,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.user.username!.toUpperCase(),
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.font2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    chat.message,
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
