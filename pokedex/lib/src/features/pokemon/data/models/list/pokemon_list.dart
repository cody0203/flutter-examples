import '../../../domain/entities/list/pokemon.dart';
import '../../../domain/entities/list/pokemon_list.dart';

import 'pokemon.dart';

class PokemonListModel extends PokemonList {
  const PokemonListModel({
    required List<PokemonInList> pokemons,
    required int currentPage,
    required int totalPages,
  }) : super(
          pokemons: pokemons,
          currentPage: currentPage,
          totalPages: totalPages,
        );

  // ignore: sort_constructors_first
  factory PokemonListModel.fromJson(Map<String, dynamic> mapJson) {
    return PokemonListModel(
      currentPage: mapJson['meta']['currentPage'] as int,
      totalPages: mapJson['meta']['totalPages'] as int,
      pokemons: List<dynamic>.from(mapJson['data'] as List<dynamic>)
          .map((dynamic pokemon) =>
              PokemonInListModel.fromJson(pokemon as Map<String, dynamic>))
          .toList(),
    );
  }
}
