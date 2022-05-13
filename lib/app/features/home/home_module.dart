import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/features/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => HomePage(name: args.data['name'])),
      ];
}
