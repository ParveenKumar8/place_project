import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/chat_model.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

// This chat widget will be display the user message sent by him/her to others.
class ChatSenderWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatSenderWidget({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 10.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Text(
                chat.message,
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const UserAvatarWidget(
            userImg: AppImages.imgCoverWomen,
          )
        ],
      ),
    );
  }
}
