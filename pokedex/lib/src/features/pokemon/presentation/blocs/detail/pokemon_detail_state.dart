part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();
}

class PokemonDetailInit extends PokemonDetailState {
  const PokemonDetailInit();

  @override
  List<Object> get props => <Object>[];
}

class PokemonDetailLoaded extends PokemonDetailState {
  const PokemonDetailLoaded({
    required this.pokemon,
  });
  final PokemonDetail pokemon;

  @override
  List<Object> get props => <Object>[pokemon];
}

class PokemonDetailError extends PokemonDetailState {
  const PokemonDetailError({
    required this.error,
  });
  final DioError error;

  @override
  List<Object> get props => <Object>[error];
}
