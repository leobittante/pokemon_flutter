import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class AppDialog {
  static message(BuildContext context, message,
          {Widget? widget, VoidCallback? action}) async =>
      await Future.delayed(
        const Duration(milliseconds: 100),
        () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.defaultPurple,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            content: widget ??
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
            actions: [
              Center(
                child: TextButton(
                    onPressed: action ?? () => Navigator.pop(context),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      );
}
