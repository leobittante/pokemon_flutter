import 'package:email_validator/email_validator.dart';

class AppValidator {
  static emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return cannotBeNullable(text);
    } else {
      return _cannotBeEmailInvalid(text);
    }
  }

  static cannotBeNullable(String? text) {
    String messageValidator = "";
    if (text == null || text.isEmpty) {
      messageValidator = "Este campo não pode ser vazio";
    }
    return messageValidator;
  }

  static cannotBeNullableAndMin8(String? text) {
    String messageValidator = "";
    if (text == null || text.isEmpty) {
      messageValidator = "Este campo não pode ser vazio";
    } else if (text.length < 8) {
      messageValidator = "Senha deve conter 8 dígitos";
    }
    return messageValidator;
  }

  static _cannotBeEmailInvalid(String text) {
    String messageValidator = "";
    final bool isValid = EmailValidator.validate(text);
    if (!isValid) {
      messageValidator = "Email inválido";
    }
    return messageValidator;
  }
}
