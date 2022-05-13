import 'package:equatable/equatable.dart';

class ResponseLoginEntity extends Equatable {
  final String email, password, name;

  const ResponseLoginEntity(
      {required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];
}
