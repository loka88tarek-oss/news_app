import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/common/themes/app_colors.dart';
import 'package:news_app/models/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 361.w,
      height: 322.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.colorScheme.secondary),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .start,
        spacing: 10.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              newsModel.image,
              width: 1.sw,
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            newsModel.title,
            style: context.textTheme.labelMedium!.copyWith(fontWeight: .bold),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                newsModel.authorizedBy,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: .w500,
                  color: AppColors.greyColor,
                ),
              ),
              Text(
                newsModel.authorizedAt,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: .w500,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
