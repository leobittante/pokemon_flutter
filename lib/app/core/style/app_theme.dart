import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.defaultPurple,
        titleTextStyle: AppTextStyles.title,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.defaultPurple,
        selectionHandleColor: AppColors.white,
        selectionColor: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.defaultPurple,
      cardTheme: const CardTheme(
        color: AppColors.defaultPurple,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: AppColors.defaultPurple,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.white,
        primary: AppColors.defaultPurple,
      ),
      primaryColor: AppColors.defaultPurple,
    );
