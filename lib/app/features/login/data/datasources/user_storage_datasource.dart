import 'dart:core';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/storage/istorage.dart';
import '../../presenter/params/user_storage_params.dart';
import '../models/response_login_model.dart';

abstract class UserStorageDataSource {
  Future<bool> setSignUp({required UserStorageParams params});
  Future<ResponseLoginModel> getLogin({required UserStorageParams params});
}

class UserStorageDataSourceImpl implements UserStorageDataSource {
  final IStorage storage;
  UserStorageDataSourceImpl({required this.storage});

  @override
  Future<ResponseLoginModel> getLogin(
      {required UserStorageParams params}) async {
    try {
      String email = await storage.load(SharedKeys.email);
      String password = await storage.load(SharedKeys.password);
      String name = await storage.load(SharedKeys.name);

      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        if (params.email == email && params.password == password) {
          return ResponseLoginModel(
              emailModel: email, nameModel: name, passwordModel: password);
        }
        throw InvalidLoginException();
      } else {
        throw StorageException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> setSignUp({required UserStorageParams params}) async {
    try {
      storage.save(SharedKeys.email, params.email);
      storage.save(SharedKeys.password, params.password);
      storage.save(SharedKeys.name, params.name!);

      return true;
    } catch (e) {
      throw StorageException;
    }
  }
}
