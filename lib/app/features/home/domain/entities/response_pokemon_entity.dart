import 'package:equatable/equatable.dart';

import 'pokemon/pokemon_entity.dart';

class ResponsePokemonEntity extends Equatable {
  final List<PokemonEntity> pokemon;

  const ResponsePokemonEntity({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}
