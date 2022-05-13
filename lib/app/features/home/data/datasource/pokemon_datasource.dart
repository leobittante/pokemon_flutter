import 'dart:convert';

import 'package:pokemon_dex/app/core/http_client/http_services.dart';
import 'package:pokemon_dex/app/core/http_client/network_info.dart';
import 'package:pokemon_dex/app/features/home/data/models/response_pokemon_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/api_const.dart';

abstract class PokemonDataSoruce {
  Future<ResponsePokemonModel> getpokemonList();
}

class PokemonDataSoruceImpl implements PokemonDataSoruce {
  final HttpServices client;
  final NetworkInfo networkInfo;

  PokemonDataSoruceImpl({required this.client, required this.networkInfo});

  @override
  Future<ResponsePokemonModel> getpokemonList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await client.get(ApiConsts.ALL_POKEMONS_LIST);

        if (response.statusCode == 200) {
          return ResponsePokemonModel.fromJson(jsonDecode(response.body));
        } else {
          throw ServerException();
        }
      } catch (e) {
        rethrow;
      }
    } else {
      throw NetworkInfoException();
    }
  }
}
