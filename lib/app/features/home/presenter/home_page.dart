import 'package:flutter/material.dart';
import 'package:yahoo_finance/app/core/style/app_text_styles.dart';

import '../../../core/style/app_colors.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.defaultPurple,
      body: SafeArea(
        child: Stack(
          children: [
            Text(
              'Olá, ' + widget.name,
              style: AppTextStyles.welcomeHomeTitle,
            )
          ],
        ),
      ),
    );
  }
}
