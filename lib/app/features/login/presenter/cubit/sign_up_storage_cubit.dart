import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_dex/app/core/errors/failures.dart';
import 'package:pokemon_dex/app/features/login/presenter/params/user_storage_params.dart';

import '../../../../core/http_client/api_messages.dart';
import '../../domain/usecases/sign_up_storage_usecase.dart';

part 'sign_up_storage_state.dart';

class SignUpStorageCubit extends Cubit<SignUpStorageState> {
  final SignUpStorageUseCase useCase;
  SignUpStorageCubit({required this.useCase}) : super(SignUpStorageInitial());

  setSignUp({required UserStorageParams params}) async {
    try {
      emit(SignUpStorageLoading());

      final result = await useCase(UserStorageParams(
          email: params.email, password: params.password, name: params.name));

      result.fold((failure) async {
        if (failure is StorageFailure) {
          _backToInitialState(const SignUpStorageError(
              errorMessage: ApiMessages.SIGN_UP_STORAGE_ERROR));
        }
      },
          (response) =>
              _backToInitialState(SignUpStorageSuccess(response: response)));
    } catch (e) {
      _backToInitialState(const SignUpStorageError());
      throw Exception(e);
    }
  }

  _backToInitialState(SignUpStorageState state) async {
    emit(state);
    await Future.delayed(const Duration(milliseconds: 50))
        .then((value) => emit(SignUpStorageInitial()));
  }
}
