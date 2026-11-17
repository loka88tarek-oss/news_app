import 'package:flutter/material.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primaryWhiteColor,
      seedColor: AppColors.primaryWhiteColor,
      secondary: AppColors.primaryBlackColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryWhiteColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryBlackColor),
      titleTextStyle: AppTextStyles.styleS20W500White,
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS24W700White,
      displayMedium: AppTextStyles.styleS22W700White,
      displaySmall: AppTextStyles.styleS20W700White,

      headlineLarge: AppTextStyles.styleS24W600White,
      headlineMedium: AppTextStyles.styleS22W600White,
      headlineSmall: AppTextStyles.styleS20W600White,

      titleLarge: AppTextStyles.styleS24W500White,
      titleMedium: AppTextStyles.styleS22W500White,
      titleSmall: AppTextStyles.styleS20W500White,

      bodyLarge: AppTextStyles.styleS24W400White,
      bodyMedium: AppTextStyles.styleS22W400White,
      bodySmall: AppTextStyles.styleS20W400White,

      labelLarge: AppTextStyles.styleS18W400White,
      labelMedium: AppTextStyles.styleS16W400White,
      labelSmall: AppTextStyles.styleS14W400White,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primaryBlackColor,
      seedColor: AppColors.primaryBlackColor,
      secondary: AppColors.primaryWhiteColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryBlackColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryWhiteColor),
      titleTextStyle: AppTextStyles.styleS20W500Black,
      backgroundColor: AppColors.primaryBlackColor,
      foregroundColor: AppColors.primaryWhiteColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS24W700Black,
      displayMedium: AppTextStyles.styleS22W700Black,
      displaySmall: AppTextStyles.styleS20W700Black,

      headlineLarge: AppTextStyles.styleS24W600Black,
      headlineMedium: AppTextStyles.styleS22W600Black,
      headlineSmall: AppTextStyles.styleS20W600Black,

      titleLarge: AppTextStyles.styleS24W500Black,
      titleMedium: AppTextStyles.styleS22W500Black,
      titleSmall: AppTextStyles.styleS20W500Black,

      bodyLarge: AppTextStyles.styleS24W400Black,
      bodyMedium: AppTextStyles.styleS22W400Black,
      bodySmall: AppTextStyles.styleS20W400Black,

      labelLarge: AppTextStyles.styleS18W400Black,
      labelMedium: AppTextStyles.styleS16W400Black,
      labelSmall: AppTextStyles.styleS14W400Black,
    ),
  );
}
