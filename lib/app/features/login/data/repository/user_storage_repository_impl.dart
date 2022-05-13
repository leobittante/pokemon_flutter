import 'package:pokemon_dex/app/features/login/data/datasources/user_storage_datasource.dart';
import 'package:pokemon_dex/app/features/login/presenter/params/user_storage_params.dart';

import 'package:pokemon_dex/app/features/login/data/models/response_login_model.dart';

import 'package:pokemon_dex/app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repository/user_storage_repository.dart';

class UserStorageRepositoryImpl implements UserStorageRepository {
  final UserStorageDataSource dataSource;
  UserStorageRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, ResponseLoginModel>> getLogin(
      {required UserStorageParams params}) async {
    try {
      return Right(await dataSource.getLogin(params: params));
    } on InvalidLoginException {
      return Left(InvalidLoginFailure());
    } on KeyNotFoundException {
      return Left(KeyNotFoundFailure());
    } on StorageException {
      return Left(StorageFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setSignUp(
      {required UserStorageParams params}) async {
    try {
      return Right(await dataSource.setSignUp(params: params));
    } on KeyNotFoundException {
      return Left(KeyNotFoundFailure());
    } on StorageException {
      return Left(StorageFailure());
    }
  }
}
