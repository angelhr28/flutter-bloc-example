part of 'pokemon_bloc.dart';

class PokemonState {
  final int offset;
  final bool isProgress;
  final List<ResultMapper>? result;

  PokemonState({
    this.offset = 0,
    this.isProgress = false,
    this.result,
  });

  PokemonState copyWith(
          {int? offset, bool? isProgress, List<ResultMapper>? result}) =>
      PokemonState(
        offset: offset ?? this.offset,
        isProgress: isProgress ?? this.isProgress,
        result: result ?? this.result,
      );
}
