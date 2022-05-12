import 'package:flutter/material.dart';

import '../../../../../../core/style/app_text_styles.dart';
import '../button_login_custom_widget.dart';
import '../text_field_custom_widget.dart';

class LoginSubScreen extends StatefulWidget {
  final Size size;
  const LoginSubScreen({Key? key, required this.size}) : super(key: key);

  @override
  State<LoginSubScreen> createState() => _LoginSubScreenState();
}

class _LoginSubScreenState extends State<LoginSubScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            'Bem-vindo ao',
            style: AppTextStyles.subTitleCards,
          ),
        ),
        const Text(
          'Yahoo Finance',
          style: AppTextStyles.titleCards,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: TextFieldCustomWidget(
              controller: textEditingControllerEmail,
              labelText: "E-mail:",
              textInputType: TextInputType.emailAddress,
              paddingHorizontal: 40,
              password: false,
            )),
        Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldCustomWidget(
              controller: textEditingControllerPassword,
              labelText: "Senha:",
              textInputType: TextInputType.number,
              paddingHorizontal: 40,
              lenghtText: 8,
              password: true,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ButtonLoginCustomWidget(
            size: widget.size,
            paddingHorizontal: 35,
            textButton: 'ENTRAR',
            onTap: () => _loginButtonAction(),
          ),
        ),
      ],
    );
  }

  //ACAO AO CLICAR NO BOTAO
  void _loginButtonAction() {}
}
