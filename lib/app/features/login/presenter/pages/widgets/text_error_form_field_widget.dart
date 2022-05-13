import 'package:flutter/material.dart';
import 'package:yahoo_finance/app/core/style/app_text_styles.dart';

class TextErrorFormFieldWidget extends StatelessWidget {
  final String text;
  const TextErrorFormFieldWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.errorFormField);
  }
}
