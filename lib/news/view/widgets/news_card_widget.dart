import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/common/themes/app_colors.dart';
import 'package:news_app/news/model/data_models/article_response_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.article});
  final Article article;
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
          SizedBox(
            width: 1.sw,
            height: 220.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: context.theme.colorScheme.secondary,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: context.theme.colorScheme.secondary,
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            article.title ?? '',
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium!.copyWith(fontWeight: .bold),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              if (article.author != null)
                Flexible(
                  child: FittedBox(
                    child: Text(
                      "by ${article.author ?? ''}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w500,
                        color: AppColors.greyColor,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              if (article.publishedAtParse != null)
                Text(
                  timeago.format(article.publishedAtParse!),
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
