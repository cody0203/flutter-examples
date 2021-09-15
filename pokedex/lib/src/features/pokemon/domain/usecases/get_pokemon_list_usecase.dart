import '../../../../core/params/list_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/list/pokemon_list.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonListUsecase
    implements Usecase<DataState<PokemonList>, ListParams> {
  GetPokemonListUsecase(this._pokemonRepository);
  final PokemonRepository _pokemonRepository;

  @override
  Future<DataState<PokemonList>> call({
    required ListParams params,
  }) {
    return _pokemonRepository.getPokemonList(page: params.page);
  }
}
