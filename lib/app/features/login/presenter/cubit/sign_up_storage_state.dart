part of 'sign_up_storage_cubit.dart';

abstract class SignUpStorageState extends Equatable {
  const SignUpStorageState();

  @override
  List<Object> get props => [];
}

class SignUpStorageInitial extends SignUpStorageState {}

class SignUpStorageLoading extends SignUpStorageState {}

class SignUpStorageSuccess extends SignUpStorageState {
  final bool response;
  const SignUpStorageSuccess({required this.response});
}

class SignUpStorageError extends SignUpStorageState {
  final String errorMessage;
  const SignUpStorageError({this.errorMessage = "Erro inesperado"});
}
