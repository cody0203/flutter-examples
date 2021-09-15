import 'package:equatable/equatable.dart';

import 'pokemon.dart';

class PokemonList extends Equatable {
  const PokemonList({
    required this.pokemons,
    required this.currentPage,
    required this.totalPages,
  });
  final List<PokemonInList> pokemons;
  final int currentPage;
  final int totalPages;

  @override
  List<Object> get props => <Object>[
        pokemons,
        currentPage,
        totalPages,
      ];
}
