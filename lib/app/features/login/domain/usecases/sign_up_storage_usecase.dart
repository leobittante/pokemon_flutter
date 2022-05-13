import 'package:yahoo_finance/app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:yahoo_finance/app/core/usecase/usecase.dart';

import '../../presenter/params/user_storage_params.dart';
import '../repository/user_storage_repository.dart';

class SignUpStorageUseCase implements UseCase<bool, UserStorageParams> {
  final UserStorageRepository repository;
  SignUpStorageUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(UserStorageParams params) {
    return repository.setSignUp(params: params);
  }
}
