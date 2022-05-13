import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/features/login/domain/usecases/login_storage_usecase.dart';
import 'package:pokemon_dex/app/features/login/presenter/cubit/login_storage_cubit.dart';
import 'package:pokemon_dex/app/features/login/presenter/cubit/sign_up_storage_cubit.dart';

import '../../core/storage/storage_shared_preferences.dart';
import 'data/datasources/user_storage_datasource.dart';
import 'data/repository/user_storage_repository_impl.dart';
import 'domain/usecases/sign_up_storage_usecase.dart';
import 'presenter/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //INJECAO DE DEPENDENCIA DO MODULAR
        // STORAGE
        Bind.factory((i) => StorageSharedPreferences()),
        Bind.factory((i) => UserStorageDataSourceImpl(storage: i())),
        Bind.factory((i) => UserStorageRepositoryImpl(dataSource: i())),

        Bind.factory((i) => SignUpStorageUseCase(repository: i())),
        Bind.singleton((i) => SignUpStorageCubit(useCase: i())),

        Bind.factory((i) => LoginStorageUseCase(repository: i())),
        Bind.singleton((i) => LoginStorageCubit(useCase: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const LoginPage()),
      ];
}
