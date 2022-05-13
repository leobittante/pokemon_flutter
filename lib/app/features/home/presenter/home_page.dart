import 'package:flutter/material.dart';
import 'package:pokemon_dex/app/core/style/app_text_styles.dart';

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
    //final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.defaultPurple,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25),
              child: Text(
                'Olá, ' + widget.name,
                style: AppTextStyles.welcomeHomeTitle,
              ),
            ),
            Column(
              children: const [],
            )
          ],
        ),
      ),
    );
  }
}
