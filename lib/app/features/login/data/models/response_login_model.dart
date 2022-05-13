import '../../domain/entity/response_login_entity.dart';

class ResponseLoginModel extends ResponseLoginEntity {
  final String emailModel, passwordModel, nameModel;

  const ResponseLoginModel(
      {required this.emailModel,
      required this.passwordModel,
      required this.nameModel})
      : super(email: emailModel, password: passwordModel, name: nameModel);
}
