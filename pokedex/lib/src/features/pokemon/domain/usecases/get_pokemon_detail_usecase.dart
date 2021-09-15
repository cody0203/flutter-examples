import '../../../../core/params/detail_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/detail/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetailUsecase
    implements Usecase<DataState<PokemonDetail>, DetailParams> {
  GetPokemonDetailUsecase(this._pokemonRepository);
  final PokemonRepository _pokemonRepository;

  @override
  Future<DataState<PokemonDetail>> call({
    required DetailParams params,
  }) {
    return _pokemonRepository.getPokemon(id: params.id);
  }
}
