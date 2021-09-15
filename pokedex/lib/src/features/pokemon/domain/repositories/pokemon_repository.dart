import '../../../../core/params/detail_params.dart';
import '../../../../core/params/search_params.dart';
import '../../../../core/resources/data_state.dart';
import '../entities/detail/pokemon.dart';
import '../entities/list/pokemon_list.dart';

abstract class PokemonRepository {
  Future<DataState<PokemonList>> getPokemonList({
    int? page,
  });

  Future<DataState<PokemonDetail>> getPokemon({
    required int id,
  });

  Future<DataState<PokemonList>> searchPokemonByName({
    required SearchParams params,
  });
}
