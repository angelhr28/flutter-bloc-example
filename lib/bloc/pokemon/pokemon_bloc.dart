import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../repository/mapper/pokemon_mapper.dart';
import '../../repository/service/pokemon_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState()) {
    on<GetListPokemon>(_onGetListPokemon);
  }

  final service = PokemonServices();

  _onGetListPokemon(PokemonEvent event, Emitter<PokemonState> emit) async {
    if (event is GetListPokemon) {
      emit(state.copyWith(isProgress: true));
      final response = await service.getPokemons(offset: state.offset);

      if (response == null) {
        emit(state.copyWith(isProgress: false));
      } else {
        final list = state.result ?? [];

        list.addAll(response.results ?? []);

        emit(state.copyWith(
            isProgress: false, offset: state.offset + 20, result: list));
      }
    }
  }
}
