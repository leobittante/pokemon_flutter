import 'package:equatable/equatable.dart';

class UserStorageParams extends Equatable {
  final String email, password;
  final String? name;

  const UserStorageParams(
      {required this.email, required this.password, this.name});

  @override
  List<Object?> get props => [email, password, name];
}
