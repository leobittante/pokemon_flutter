import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/response_login_model.dart';
import '../../presenter/params/user_storage_params.dart';

abstract class UserStorageRepository {
  Future<Either<Failure, bool>> setSignUp({required UserStorageParams params});
  Future<Either<Failure, ResponseLoginModel>> getLogin(
      {required UserStorageParams params});
}
