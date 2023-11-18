import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/pages/edit_profile_page.dart';
import 'package:place_project/pages/favorite_page.dart';
import 'package:place_project/pages/home_page.dart';
import 'package:place_project/pages/message_page.dart';
import 'package:place_project/pages/profile_page.dart';
import 'package:place_project/widgets/bottom_nav_item_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomNavOptions currentIndex = BottomNavOptions.home;

  List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const EditProfilePage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

enum BottomNavOptions {
  home,
  favorite,
  addPost,
  messages,
  profile,
}

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavOptions currentIndex;
  final ValueChanged<BottomNavOptions> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.0,
      margin: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 17.0,
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(
                  24.0,
                ),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: BottomNavItemWidget(
                      currentIndex: currentIndex,
                      onPressed: () => onTap(BottomNavOptions.home),
                      icon: AppImages.svgHome,
                      nameIndex: BottomNavOptions.home,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItemWidget(
                      currentIndex: currentIndex,
                      onPressed: () => onTap(BottomNavOptions.favorite),
                      icon: AppImages.svgFavorite,
                      nameIndex: BottomNavOptions.favorite,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: BottomNavItemWidget(
                      currentIndex: currentIndex,
                      onPressed: () => onTap(BottomNavOptions.messages),
                      icon: AppImages.svgMessage,
                      nameIndex: BottomNavOptions.messages,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItemWidget(
                      currentIndex: currentIndex,
                      onPressed: () => onTap(BottomNavOptions.profile),
                      icon: AppImages.svgProfile,
                      nameIndex: BottomNavOptions.profile,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              child: Container(
                width: 64.0,
                height: 64.0,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: SvgPicture.asset(
                  AppImages.svgAdd,
                  // fit: BoxFit.contain,
                  width: 24.0,
                  height: 24.0,
                  // colorFilter: ColorFilter.mode(
                  //   currentIndex == BottomNavOptions.addPost
                  //       ? AppColors.blackColor
                  //       : AppColors.blackColor.withOpacity(0.3),
                  //   BlendMode.srcIn,
                  // ),
                ),
              ),
              onTap: () => onTap(BottomNavOptions.addPost),
            ),
          ),
        ],
      ),
    );
  }
}
// BottomNavigationBar(
      //   backgroundColor: AppColors.primaryColor,
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         AppImages.svgHome,
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: AppStrings.homeStr,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         AppImages.svgFavorite,
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: AppStrings.favoriteStr,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         AppImages.svgAdd,
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: AppStrings.addStr,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         AppImages.svgMessage,
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: AppStrings.messageStr,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         AppImages.svgProfile,
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: AppStrings.profileStr,
      //     ),
      //   ],
      //   currentIndex: currentIndex,
      // ),