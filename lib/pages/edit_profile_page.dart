import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/button_widget.dart';
import 'package:place_project/widgets/text_field_widget.dart';
import 'package:place_project/widgets/user_avatar_widget.dart';

enum EditProfileMenu {
  cancel,
}

enum Gender {
  none,
  male,
  female,
  other,
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    double sceenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarWidget(
        pageTitle: AppStrings.editProfileStr,
        actions: [
          PopupMenuButton<EditProfileMenu>(
            icon: const Icon(Icons.more_vert_outlined),
            onSelected: (value) {
              switch (value) {
                case EditProfileMenu.cancel:
                  print("Cancel clicked");
                default:
                  print("Default clicked");
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: EditProfileMenu.cancel,
                  child: Text(
                    AppStrings.cancelStr,
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sceenHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UserAvatarWidget(
                      userImg: AppImages.imgCoverWomen,
                      imgSize: 120.0,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Icon(
                        Icons.photo_camera,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const TextFieldWidget(
                hintText: AppStrings.firstNameStr,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const TextFieldWidget(
                hintText: AppStrings.lastNameStr,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const TextFieldWidget(
                hintText: AppStrings.phoneNumberStr,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const TextFieldWidget(
                hintText: AppStrings.locationStr,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const TextFieldWidget(
                hintText: AppStrings.birthdayStr,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundInput,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 8.0,
                      ),
                      child: Text(
                        AppStrings.genderStr,
                        style: AppTextStyles.subTitle3.copyWith(
                          fontSize: 12.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text(AppStrings.maleStr),
                            value: Gender.male,
                            groupValue: gender,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            activeColor: AppColors.primaryColor,
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text(AppStrings.femaleStr),
                            value: Gender.female,
                            groupValue: gender,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            activeColor: AppColors.primaryColor,
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<Gender>(
                              title: const Text(AppStrings.otherStr),
                              value: Gender.other,
                              groupValue: gender,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              activeColor: AppColors.primaryColor,
                              onChanged: (newValue) {
                                setState(() {
                                  gender = newValue!;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ButtonWidget(
                buttonName: AppStrings.saveStr,
                onPressed: () => {
                  Navigator.of(context).pop(),
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
