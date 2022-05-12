import 'package:flutter/material.dart';

import '../../../../../../core/style/app_text_styles.dart';
import '../button_login_custom_widget.dart';
import '../text_field_custom_widget.dart';

class SignUpSubScreen extends StatefulWidget {
  final Size size;
  const SignUpSubScreen({Key? key, required this.size}) : super(key: key);

  @override
  State<SignUpSubScreen> createState() => _SignUpSubScreenState();
}

class _SignUpSubScreenState extends State<SignUpSubScreen> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'Inscreva-se',
            style: AppTextStyles.titleCards,
          ),
        ),
        TextFieldCustomWidget(
          controller: textEditingControllerName,
          labelText: "Nome:",
          textInputType: TextInputType.name,
          paddingHorizontal: 40,
          password: false,
          lenghtText: 20,
        ),
        TextFieldCustomWidget(
          controller: textEditingControllerEmail,
          labelText: "E-mail:",
          textInputType: TextInputType.emailAddress,
          paddingHorizontal: 40,
          password: false,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldCustomWidget(
              controller: textEditingControllerPassword,
              labelText: "Senha:",
              textInputType: TextInputType.number,
              paddingHorizontal: 40,
              password: true,
              lenghtText: 8,
            )),
        Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldCustomWidget(
              controller: textEditingControllerConfirm,
              labelText: "Confirmar Senha:",
              textInputType: TextInputType.number,
              paddingHorizontal: 40,
              password: true,
              lenghtText: 8,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ButtonLoginCustomWidget(
            size: widget.size,
            paddingHorizontal: 35,
            textButton: 'CADASTRAR',
            onTap: () => _signUpButtonAction(),
          ),
        ),
      ],
    );
  }

  //ACAO AO CLICAR NO BOTAO
  void _signUpButtonAction() {}
}
