import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../login/presenter/pages/style/widgets_style.dart';

class ButtonReloadWidget extends StatefulWidget {
  final Size size;
  final double paddingHorizontal;
  final bool loading;
  final VoidCallback? onTap;
  const ButtonReloadWidget(
      {Key? key,
      required this.size,
      required this.loading,
      this.onTap,
      this.paddingHorizontal = 0})
      : super(key: key);

  @override
  State<ButtonReloadWidget> createState() => _ButtonReloadWidgetState();
}

class _ButtonReloadWidgetState extends State<ButtonReloadWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
        child: TextButton(
            onPressed: widget.onTap,
            child: Container(
              height: widget.size.height * .05,
              width: widget.size.width * .2,
              decoration: WidgetStyle.boxDecorationButtonReload,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!widget.loading) ...const [
                      Icon(
                        Icons.autorenew_rounded,
                        color: AppColors.white,
                      )
                    ] else ...[
                      SizedBox(
                        height: widget.size.height * .03,
                        width: widget.size.width * .03,
                        child: const CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                      )
                    ]
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
