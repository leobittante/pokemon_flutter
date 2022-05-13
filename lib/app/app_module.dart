import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/features/login/login_module.dart';

import 'app_routes.dart';
import 'features/exit/exit_module.dart';
import 'features/home/home_module.dart';
import 'features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.splash,
          module: SplashModule(),
        ),
        ModuleRoute(
          AppRoutes.login,
          module: LoginModule(),
        ),
        ModuleRoute(
          AppRoutes.home,
          module: HomeModule(),
        ),
        ModuleRoute(
          AppRoutes.exit,
          module: ExitModule(),
        ),
      ];
}
