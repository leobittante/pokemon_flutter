import 'package:flutter/material.dart';
import 'package:yahoo_finance/app/core/style/app_text_styles.dart';
import 'package:yahoo_finance/app/features/login/presenter/pages/style/widgets_style.dart';

class ButtonLoginCustomWidget extends StatelessWidget {
  final Size size;
  final double paddingHorizontal;
  final String textButton;
  final VoidCallback? onTap;
  const ButtonLoginCustomWidget(
      {Key? key,
      required this.size,
      required this.textButton,
      this.onTap,
      this.paddingHorizontal = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: TextButton(
            onPressed: onTap,
            child: Container(
              height: size.height * .07,
              width: size.width,
              decoration: WidgetStyle.boxDecorationButtonLogin,
              child: Center(
                child: Text(
                  textButton,
                  style: AppTextStyles.button,
                ),
              ),
            )),
      ),
    );
  }
}
