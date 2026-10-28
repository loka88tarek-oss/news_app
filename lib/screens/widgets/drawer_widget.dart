import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/themes/app_colors.dart';
import 'package:news_app/common/widgets/cutome_drop_down_menue_widget.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBlackColor,
      width: 270.w,
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Container(
            alignment: Alignment(0, 0),
            width: 270.w,
            height: 166.h,
            color: AppColors.primaryWhiteColor,
            child: Text("News App", style: AppTextStyles.styleS24W700White),//TODO localization
          ),
          ListTile(
            onTap: () {
              Provider.of<MainScreenProvider>(context,listen: false).changeCategory(null);
              Navigator.of(context).pop();
            },
            title: Text("Go To Home", style: AppTextStyles.styleS20W700Black),
            leading: Icon(
              Icons.home_outlined,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          Divider(
            color: AppColors.primaryWhiteColor,
            indent: 16.w,
            endIndent: 16.w,
          ),
          ListTile(
            title: Text("Theme", style: AppTextStyles.styleS20W700Black),
            leading: Icon(
              Icons.imagesearch_roller_outlined,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          CutomeDropDownMenueWidget(
            foreGroundColor: AppColors.primaryWhiteColor,
            bgColor: AppColors.primaryBlackColor,
            items: [
              DropdownMenuEntry(value: ThemeMode.dark, label: "Dark"),
              DropdownMenuEntry(value: ThemeMode.light, label: "Light"),
            ],
          ),
          Divider(
            color: AppColors.primaryWhiteColor,
            indent: 16.w,
            endIndent: 16.w,
          ),
          ListTile(
            title: Text("Language", style: AppTextStyles.styleS20W700Black),
            leading: Icon(
              Icons.language_outlined,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          CutomeDropDownMenueWidget(
            foreGroundColor: AppColors.primaryWhiteColor,
            bgColor: AppColors.primaryBlackColor,
            items: [
              DropdownMenuEntry(value: "ar", label: "Arabic"),
              DropdownMenuEntry(value: "en", label: "English"),
            ],
          ),
        ],
      ),
    );
  }
}
