import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/user_model.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/user_provider.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel? user = UserProvider.of(context);
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
      body: Column(
        children: [
          const UserAvatarWidget(
            userImg: AppImages.imgCoverWomen,
            imgSize: 90.0,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            user?.username ?? "",
            style: AppTextStyles.header2,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Row(
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
          const SizedBox(
            height: 12.0,
          ),
          const Row(
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
          const Divider(
            height: 24.0,
            indent: 24.0,
            endIndent: 24.0,
          ),
        ],
      ),
    );
  }
}
