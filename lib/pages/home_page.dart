import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/post_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        pageTitle: AppStrings.homeStr,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.nearByPlace),
            icon: SvgPicture.asset(
              AppImages.svgLocationPin,
              width: 24.0,
              height: 24.0,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return const PostItemWidget();
        },
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(
          height: 12.0,
        ),
      ),
    );
  }
}
