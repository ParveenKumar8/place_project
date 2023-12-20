import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/user_model.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

class UserPageItemWidget extends StatelessWidget {
  final UserModel user;
  const UserPageItemWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const UserAvatarWidget(
                userImg: AppImages.imgCoverWomen,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                user.username!,
                style: AppTextStyles.header2.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Text(
            'Lat: ${user.company?.address?.coordinates?.lat!}',
            style: AppTextStyles.header3.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          Text(
            'Lng: ${user.company?.address?.coordinates?.lng!}',
            style: AppTextStyles.header3.copyWith(
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
