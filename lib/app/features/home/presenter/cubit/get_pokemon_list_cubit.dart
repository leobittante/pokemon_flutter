import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_dex/app/core/usecase/usecase.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/response_pokemon_entity.dart';
import 'package:pokemon_dex/app/features/home/domain/usecases/get_pokemon_list_usecasa.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/http_client/api_messages.dart';

part 'get_pokemon_list_state.dart';

class GetPokemonListCubit extends Cubit<GetPokemonListState> {
  final PokemonListUseCase useCase;
  GetPokemonListCubit({required this.useCase}) : super(GetPokemonListInitial());

  getPokemonList() async {
    try {
      emit(GetPokemonListLoading());

      final result = await useCase(NoParams());

      result.fold((failure) async {
        if (failure is ServerFailure) {
          _backToInitialState(const GetPokemonListError(
              errorMessage: ApiMessages.SERVER_ERROR_MESSAGE));
        } else if (failure is NetworkInfoFailure) {
          _backToInitialState(const GetPokemonListError(
              errorMessage: ApiMessages.NETWORK_FAILURE_MESSAGE));
        }
      },
          (response) =>
              _backToInitialState(GetPokemonListSuccess(response: response)));
    } catch (e) {
      _backToInitialState(const GetPokemonListError());
      throw Exception(e);
    }
  }

  _backToInitialState(GetPokemonListState state) async {
    emit(state);
    await Future.delayed(const Duration(milliseconds: 50))
        .then((value) => emit(GetPokemonListInitial()));
  }
}
