import 'package:flutter/material.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel post;
  const PostItemWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

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
              Expanded(
                child: Text(
                  '${post.title}',
                  style: AppTextStyles.subTitle3,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
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
          Text(
            '${post.body}',
            style: AppTextStyles.subTitle3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.favorite_outline,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${post.reactions}',
                style: AppTextStyles.subTitle3,
              ),
              const SizedBox(
                width: 12.0,
              ),
              const Icon(
                Icons.message_outlined,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${post.userId}',
                style: AppTextStyles.subTitle3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
