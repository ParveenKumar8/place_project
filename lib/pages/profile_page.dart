import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        pageTitle: AppStrings.profileStr,
        actions: [
          PopupMenuButton<ProfileMenu>(
            icon: const Icon(Icons.more_vert_outlined),
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                case ProfileMenu.logout:
                  print("Logout clicked");
                default:
                  print("Default clicked");
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: ProfileMenu.edit,
                  child: Text(AppStrings.editStr),
                ),
                const PopupMenuItem(
                  value: ProfileMenu.logout,
                  child: Text(AppStrings.logoutStr),
                ),
              ];
            },
          )
        ],
      ),
      body: const Column(
        children: [
          UserAvatarWidget(
            userImg: AppImages.imgCoverWomen,
            imgSize: 90.0,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            "Bhawna Kaundal",
            style: AppTextStyles.header2,
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_sharp,
                color: AppColors.primaryColor,
                size: 16.0,
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                "India",
                style: AppTextStyles.body2,
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '476',
                    style: AppTextStyles.header2,
                  ),
                  Text(
                    AppStrings.followerStr,
                    style: AppTextStyles.body2,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '476',
                    style: AppTextStyles.header2,
                  ),
                  Text(
                    AppStrings.postStr,
                    style: AppTextStyles.body2,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '476',
                    style: AppTextStyles.header2,
                  ),
                  Text(
                    AppStrings.followingStr,
                    style: AppTextStyles.body2,
                  ),
                ],
              )
            ],
          ),
          Divider(
            height: 24.0,
            indent: 24.0,
            endIndent: 24.0,
          ),
        ],
      ),
    );
  }
}
