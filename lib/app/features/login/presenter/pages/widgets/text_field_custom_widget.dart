import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/style/app_colors.dart';

class TextFieldCustomWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final double paddingHorizontal;
  final bool password;
  final int lenghtText;
  final FormFieldValidator<String>? validator;
  const TextFieldCustomWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.validator,
    required this.labelText,
    this.paddingHorizontal = 0,
    required this.password,
    this.lenghtText = 50,
  }) : super(key: key);

  @override
  State<TextFieldCustomWidget> createState() => _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends State<TextFieldCustomWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: widget.password ? _obscureText : false,
            maxLines: 1,
            validator: widget.validator,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.lenghtText),
            ],
            style: const TextStyle(color: AppColors.black, fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: widget.password
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(!_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : null,
              alignLabelWithHint: true,
              labelText: widget.labelText,
              labelStyle:
                  const TextStyle(color: AppColors.black54, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
