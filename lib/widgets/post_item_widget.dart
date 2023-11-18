import 'package:flutter/material.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_text_styles.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.imgCoverWomen,
                width: 36,
                height: 36,
              ),
              const SizedBox(
                width: 12.0,
              ),
              const Text(
                "Sarah Elizabeth",
                style: AppTextStyles.subTitle3,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Image.asset(
            AppImages.imgPost1,
            // width: width,
            // height: 120.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.favorite_outline,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "9",
                style: AppTextStyles.subTitle3,
              ),
              SizedBox(
                width: 12.0,
              ),
              Icon(
                Icons.message_outlined,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "20",
                style: AppTextStyles.subTitle3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
