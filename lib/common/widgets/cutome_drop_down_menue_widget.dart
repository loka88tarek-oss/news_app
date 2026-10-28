import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';


class CutomeDropDownMenueWidget extends StatelessWidget {
  const CutomeDropDownMenueWidget({super.key, required this.foreGroundColor, required this.bgColor, required this.items});
final Color foreGroundColor;
final Color bgColor;
final List<DropdownMenuEntry> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
            child: DropdownMenu(
              width: 230.w,

              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(
                 bgColor ,
                ),
                elevation: WidgetStateProperty.all(5),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              trailingIcon: Icon(
                Icons.arrow_drop_down,
                color: foreGroundColor,
              ),
              textStyle: AppTextStyles.styleS20W500Black,

              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: foreGroundColor),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: foreGroundColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: foreGroundColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: foreGroundColor,
                    width: 1.5,
                  ),
                ),
              ),
             dropdownMenuEntries: items.map((e)=>DropdownMenuEntry(value: e.value, label: e.label,style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      foreGroundColor,
                    ),
                  ),)).toList(),
            ),
          ) 
         ;
  }
}
