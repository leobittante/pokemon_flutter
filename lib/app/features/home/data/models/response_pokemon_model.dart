import 'package:pokemon_dex/app/features/home/data/models/pokemon/pokemon_model.dart';

import '../../domain/entities/response_pokemon_entity.dart';

class ResponsePokemonModel extends ResponsePokemonEntity {
  final List<PokemonModel> pokemonModel;

  const ResponsePokemonModel({required this.pokemonModel})
      : super(pokemon: pokemonModel);

  factory ResponsePokemonModel.fromJson(Map<String, dynamic> json) {
    List<PokemonModel> listPokemon = [];
    return ResponsePokemonModel(
        pokemonModel: json['pokemon'].forEach((v) {
      listPokemon.add(PokemonModel.fromJson(v));
    }));
  }
}
