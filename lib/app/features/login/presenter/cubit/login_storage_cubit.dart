import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yahoo_finance/app/core/errors/failures.dart';
import 'package:yahoo_finance/app/features/login/domain/entity/response_login_entity.dart';
import 'package:yahoo_finance/app/features/login/domain/usecases/login_storage_usecase.dart';

import '../../../../core/http_client/api_messages.dart';
import '../params/user_storage_params.dart';

part 'login_storage_state.dart';

class LoginStorageCubit extends Cubit<LoginStorageState> {
  final LoginStorageUseCase useCase;
  LoginStorageCubit({required this.useCase}) : super(LoginStorageInitial());

  getLogin({required UserStorageParams params}) async {
    try {
      emit(LoginStorageLoading());

      final result = await useCase(
          UserStorageParams(email: params.email, password: params.password));

      result.fold((failure) async {
        if (failure is InvalidLoginFailure) {
          _backToInitialState(const LoginStorageError(
              errorMessage: ApiMessages.LOGIN_INVALID_PARAMS));
        } else if (failure is StorageFailure) {
          _backToInitialState(const LoginStorageError(
              errorMessage: ApiMessages.STORAGE_ERROR_MESSAGE));
        } else if (failure is KeyNotFoundFailure) {
          _backToInitialState(const LoginStorageError(
              errorMessage: ApiMessages.KEY_NOT_FOUND_USER_ERROR));
        }
      },
          (response) =>
              _backToInitialState(LoginStorageSuccess(response: response)));
    } catch (e) {
      _backToInitialState(const LoginStorageError());
      throw Exception(e);
    }
  }

  _backToInitialState(LoginStorageState state) async {
    emit(state);
    await Future.delayed(const Duration(milliseconds: 50))
        .then((value) => emit(LoginStorageInitial()));
  }
}
