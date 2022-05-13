import 'package:flutter_modular/flutter_modular.dart';
import 'package:yahoo_finance/app/features/home/presenter/home_page.dart';

class HomehModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => HomePage(name: args.data['name'])),
      ];
}
