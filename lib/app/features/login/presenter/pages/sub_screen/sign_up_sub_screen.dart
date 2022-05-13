import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yahoo_finance/app/core/dialogs/app_dialogs.dart';
import 'package:yahoo_finance/app/features/login/presenter/cubit/sign_up_storage_cubit.dart';
import 'package:yahoo_finance/app/features/login/presenter/params/user_storage_params.dart';

import '../../../../../core/style/app_text_styles.dart';
import '../../../../../core/utils/validators.dart';
import '../widgets/button_login_custom_widget.dart';
import '../widgets/text_error_form_field_widget.dart';
import '../widgets/text_field_custom_widget.dart';

class SignUpSubScreen extends StatefulWidget {
  final Size size;
  const SignUpSubScreen({Key? key, required this.size}) : super(key: key);

  @override
  State<SignUpSubScreen> createState() => _SignUpSubScreenState();
}

class _SignUpSubScreenState extends State<SignUpSubScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textEditingControllerName,
      textEditingControllerEmail,
      textEditingControllerPassword,
      textEditingControllerConfirm;

  bool validatePassword8 = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _setupControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpStorageCubit, SignUpStorageState>(
        bloc: Modular.get<SignUpStorageCubit>(),
        builder: (context, state) {
          if (state is SignUpStorageLoading) {
            loading = true;
          }
          if (state is SignUpStorageSuccess) {
            loading = false;
            AppDialog.message(context, 'Usuário cadastrado com sucesso!');
          }
          if (state is SignUpStorageError) {
            loading = false;
            AppDialog.message(context, state.errorMessage);
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: formKey,
              child: Column(
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
                    password: false,
                    lenghtText: 20,
                    validator: (value) =>
                        !AppValidator.cannotBeNullable(value).isEmpty
                            ? AppValidator.cannotBeNullable(value)
                            : null,
                  ),
                  TextFieldCustomWidget(
                    controller: textEditingControllerEmail,
                    labelText: "E-mail:",
                    textInputType: TextInputType.emailAddress,
                    password: false,
                    validator: (value) =>
                        !AppValidator.emailValidator(value).isEmpty
                            ? AppValidator.emailValidator(value)
                            : null,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFieldCustomWidget(
                        controller: textEditingControllerPassword,
                        labelText: "Senha:",
                        textInputType: TextInputType.number,
                        password: true,
                        lenghtText: 8,
                        validator: (value) =>
                            !AppValidator.cannotBeNullableAndMin8(value).isEmpty
                                ? AppValidator.cannotBeNullableAndMin8(value)
                                : null,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFieldCustomWidget(
                        controller: textEditingControllerConfirm,
                        labelText: "Confirmar Senha:",
                        textInputType: TextInputType.number,
                        password: true,
                        lenghtText: 8,
                        validator: (value) =>
                            !AppValidator.cannotBeNullableAndMin8(value).isEmpty
                                ? AppValidator.cannotBeNullableAndMin8(value)
                                : null,
                      )),
                  if (validatePassword8) ...const [
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextErrorFormFieldWidget(
                              text: 'Senhas não conferem')),
                    )
                  ],
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ButtonLoginCustomWidget(
                      size: widget.size,
                      paddingHorizontal: 35,
                      textButton: 'CADASTRAR',
                      loading: loading,
                      onTap: () => _signUpButtonAction(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //ACAO AO CLICAR NO BOTAO
  void _signUpButtonAction() {
    final form = formKey.currentState!;
    if (form.validate()) {
      if (textEditingControllerPassword.text ==
          textEditingControllerConfirm.text) {
        setState(() {
          validatePassword8 = false;
        });
        Modular.get<SignUpStorageCubit>().setSignUp(
            params: UserStorageParams(
                email: textEditingControllerEmail.text,
                password: textEditingControllerPassword.text,
                name: textEditingControllerName.text));
      } else {
        setState(() {
          validatePassword8 = true;
        });
      }
    }
  }

  void _setupControllers() {
    textEditingControllerName = TextEditingController();
    textEditingControllerEmail = TextEditingController();
    textEditingControllerPassword = TextEditingController();
    textEditingControllerConfirm = TextEditingController();
  }
}
