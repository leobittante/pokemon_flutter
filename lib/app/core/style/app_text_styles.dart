import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const String _fontPoppins = 'Poppins';

  static const TextStyle pokemonCard = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontFamily: _fontPoppins,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontFamily: _fontPoppins,
    //fontWeight: FontWeight.w700,
  );

  static const TextStyle welcomeHomeTitle = TextStyle(
    color: AppColors.white,
    fontSize: 22,
    fontFamily: _fontPoppins,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle title = TextStyle(
    color: AppColors.black54,
    fontSize: 23,
  );

  static const TextStyle titleCards = TextStyle(
    color: AppColors.black54,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: _fontPoppins,
  );

  static const TextStyle subTitleCards = TextStyle(
    color: AppColors.black54,
    fontSize: 15,
    fontFamily: _fontPoppins,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle subTitleCardsBold = TextStyle(
    color: AppColors.black54,
    fontSize: 15,
    fontFamily: _fontPoppins,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle errorFormField = TextStyle(
    color: AppColors.redAccent,
    fontSize: 12,
    fontFamily: _fontPoppins,
    fontWeight: FontWeight.w500,
  );
}
