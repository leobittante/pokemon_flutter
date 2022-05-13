import 'package:dartz/dartz.dart';
import 'package:pokemon_dex/app/features/login/domain/entity/response_login_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presenter/params/user_storage_params.dart';
import '../repository/user_storage_repository.dart';

class LoginStorageUseCase
    implements UseCase<ResponseLoginEntity, UserStorageParams> {
  final UserStorageRepository repository;
  LoginStorageUseCase({required this.repository});

  @override
  Future<Either<Failure, ResponseLoginEntity>> call(UserStorageParams params) {
    return repository.getLogin(params: params);
  }
}
