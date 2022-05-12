import 'package:flutter/material.dart';
import 'package:yahoo_finance/app/core/widgets/exchange_animation_widget.dart';
import 'package:yahoo_finance/app/features/login/presenter/pages/widgets/background_with_logo_widget.dart';
import 'package:yahoo_finance/app/features/login/presenter/pages/style/widgets_style.dart';
import 'package:yahoo_finance/app/features/login/presenter/pages/widgets/sub_screen/login_sub_screen.dart';
import 'package:yahoo_finance/app/features/login/presenter/pages/widgets/sub_screen/sign_up_sub_screen.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool animationForward = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithLogoWidget(size: size),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    Container(
                      height: size.height * .6,
                      width: size.width * .85,
                      decoration: WidgetStyle.boxDecorationLogin,
                      child: SingleChildScrollView(
                        child: ExchangeAnimationFade(
                          animationForward: animationForward,
                          firstWidget: LoginSubScreen(size: size),
                          secondWidget: SignUpSubScreen(size: size),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            !animationForward
                                ? 'Não tem uma conta? '
                                : 'Já tem conta? ',
                            style: AppTextStyles.subTitleCards,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                animationForward = !animationForward;
                              });
                            },
                            child: Text(
                              !animationForward ? 'Inscreva-se' : 'Entrar',
                              style: AppTextStyles.subTitleCardsBold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
