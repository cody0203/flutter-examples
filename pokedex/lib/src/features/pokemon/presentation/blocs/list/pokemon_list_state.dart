part of 'pokemon_list_bloc.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => <Object>[];
}

class PokemonListInit extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  const PokemonListLoaded({
    required this.pokemonList,
  });
  final PokemonList pokemonList;

  @override
  List<Object> get props => <Object>[pokemonList];
}

class PokemonListError extends PokemonListState {
  const PokemonListError({
    required this.error,
  });
  final DioError error;

  @override
  List<Object> get props => <Object>[error];
}
