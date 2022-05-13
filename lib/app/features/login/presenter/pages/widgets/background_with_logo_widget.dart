import 'package:flutter/material.dart';

import '../../../../../core/assets/images/app_images.dart';
import '../../../../../core/style/app_colors.dart';

class BackgroundWithLogoWidget extends StatelessWidget {
  final Size size;
  const BackgroundWithLogoWidget({Key? key, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .6,
      width: size.width,
      decoration: const BoxDecoration(
          color: AppColors.defaultPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 200),
        child: Image.asset(
          AppImages.logo,
          filterQuality: FilterQuality.high,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
