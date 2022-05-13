import 'package:dartz/dartz.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/response_pokemon_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, ResponsePokemonEntity>> getPokemonList();
}
