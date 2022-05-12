import 'package:flutter/material.dart';

import '../../../../../core/style/app_colors.dart';

class WidgetStyle {
  static const BoxDecoration boxDecorationLogin = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(25)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
    ],
  );

  static const BoxDecoration boxDecorationButtonLogin = BoxDecoration(
    color: AppColors.defaultPurple,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.black54, blurRadius: 5.0, offset: Offset(0.0, 0.75))
    ],
  );
}
