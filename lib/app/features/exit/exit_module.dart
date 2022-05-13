import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/features/exit/presenter/page/exit_page.dart';

class ExitModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const ExitPage()),
      ];
}
