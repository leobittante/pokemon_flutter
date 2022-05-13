part of 'login_storage_cubit.dart';

abstract class LoginStorageState extends Equatable {
  const LoginStorageState();

  @override
  List<Object> get props => [];
}

class LoginStorageInitial extends LoginStorageState {}

class LoginStorageLoading extends LoginStorageState {}

class LoginStorageSuccess extends LoginStorageState {
  final ResponseLoginEntity response;
  const LoginStorageSuccess({required this.response});
}

class LoginStorageError extends LoginStorageState {
  final String errorMessage;
  const LoginStorageError({this.errorMessage = "Erro inesperado"});
}

class LoginInvalidParams extends LoginStorageState {
  final String errorMessage;
  const LoginInvalidParams({required this.errorMessage});
}
