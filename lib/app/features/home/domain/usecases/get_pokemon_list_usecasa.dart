import 'package:pokemon_dex/app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_dex/app/core/usecase/usecase.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/response_pokemon_entity.dart';
import 'package:pokemon_dex/app/features/home/domain/repositories/pokemon_repository.dart';

class PokemonListUseCase extends UseCase<ResponsePokemonEntity, NoParams> {
  final PokemonRepository repository;
  PokemonListUseCase({required this.repository});

  @override
  Future<Either<Failure, ResponsePokemonEntity>> call(NoParams params) {
    return repository.getPokemonList();
  }
}
