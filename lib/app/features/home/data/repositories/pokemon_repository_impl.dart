import 'package:pokemon_dex/app/features/home/data/datasource/pokemon_datasource.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/response_pokemon_entity.dart';

import 'package:pokemon_dex/app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSoruce dataSoruce;
  const PokemonRepositoryImpl({required this.dataSoruce});

  @override
  Future<Either<Failure, ResponsePokemonEntity>> getPokemonList() async {
    try {
      return Right(await dataSoruce.getpokemonList());
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkInfoException {
      return Left(NetworkInfoFailure());
    }
  }
}
