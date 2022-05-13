import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/features/home/data/datasource/pokemon_datasource.dart';
import 'package:pokemon_dex/app/features/home/presenter/cubit/get_pokemon_list_cubit.dart';
import 'package:pokemon_dex/app/features/home/presenter/home_page.dart';

import '../../core/http_client/http_services.dart';
import '../../core/http_client/network_info.dart';
import 'data/repositories/pokemon_repository_impl.dart';
import 'domain/usecases/get_pokemon_list_usecasa.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => InternetAddressLookup()),
        Bind.factory((i) => NetworkInfo(i())),
        Bind.factory((i) => HHttpServices(networkInfo: i())),
        Bind.factory(
            (i) => PokemonDataSoruceImpl(client: i(), networkInfo: i())),
        Bind.factory((i) => PokemonRepositoryImpl(dataSoruce: i())),
        Bind.factory((i) => PokemonListUseCase(repository: i())),
        Bind.singleton((i) => GetPokemonListCubit(useCase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => HomePage(name: args.data['name'])),
      ];
}
