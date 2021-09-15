import '../../../../core/params/search_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/list/pokemon_list.dart';
import '../repositories/pokemon_repository.dart';

class SearchPokemonByNameUsecase
    implements Usecase<DataState<PokemonList>, SearchParams> {
  SearchPokemonByNameUsecase(this._pokemonRepository);
  final PokemonRepository _pokemonRepository;

  @override
  Future<DataState<PokemonList>> call({
    required SearchParams params,
  }) {
    return _pokemonRepository.searchPokemonByName(params: params);
  }
}
