import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yahoo_finance/app/core/assets/images/app_images.dart';
import 'package:yahoo_finance/app/core/style/app_colors.dart';

import '../../../../app_routes.dart';
import '../../../../core/utils/assert_route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _timerSplash();
  }

  //TIMER PARA O SPLASH SCREEN
  _timerSplash() {
    Timer.periodic(
        const Duration(seconds: 4),
        (timer) =>
            Modular.to.pushReplacementNamed(assertRoute(AppRoutes.login)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.defaultPurple,
        child: Center(
            child: Image.asset(
          AppImages.logo,
          filterQuality: FilterQuality.high,
        )));
  }
}
