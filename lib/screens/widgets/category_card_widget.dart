import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/extensions/context_extension.dart';
import 'package:news_app/common/extensions/widget_extension.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEnum,
    required this.isEven,
  });
  final CategoryEnum categoryEnum;
  final bool isEven;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: 1.sw,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(categoryEnum.getImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(24.r),
        color: context.theme.colorScheme.secondary,
      ),
      alignment: !isEven ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: isEven
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            categoryEnum.name,
            style: context.textTheme.displayLarge!.copyWith(
              fontSize: 30.sp,
              color: context.theme.colorScheme.primary,
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<MainScreenProvider>(
                context,
                listen: false,
              ).changeCategory(categoryEnum);
            },
            child: Container(
              width: 169.w,
              height: 54.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(84),
                color: context.theme.colorScheme.primary.withValues(alpha: .5),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  if (!isEven)
                    CircleAvatar(
                      backgroundColor: context.theme.colorScheme.primary,
                      radius: 27.r,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                  Text(
                    "View All",

                    style: context.textTheme.titleLarge,
                  ).symmetricPadding(horizontal: 12.w, vertical: 9.h),
                  if (isEven)
                    CircleAvatar(
                      backgroundColor: context.theme.colorScheme.primary,
                      radius: 27.r,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
