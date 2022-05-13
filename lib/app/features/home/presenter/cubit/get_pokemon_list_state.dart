part of 'get_pokemon_list_cubit.dart';

abstract class GetPokemonListState extends Equatable {
  const GetPokemonListState();

  @override
  List<Object> get props => [];
}

class GetPokemonListInitial extends GetPokemonListState {}

class GetPokemonListLoading extends GetPokemonListState {}

class GetPokemonListSuccess extends GetPokemonListState {
  final ResponsePokemonEntity response;
  const GetPokemonListSuccess({required this.response});
}

class GetPokemonListError extends GetPokemonListState {
  final String errorMessage;
  const GetPokemonListError({this.errorMessage = "Erro inesperado"});
}
