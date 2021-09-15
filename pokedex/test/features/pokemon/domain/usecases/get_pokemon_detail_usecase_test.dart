import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex/src/core/resources/data_state.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/pokemon.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex/src/core/params/detail_params.dart';

import '../../../../mocks/pokemon.dart';
import 'get_pokemon_detail_usecase_test.mocks.dart';

final DetailParams params = DetailParams(id: 1);

Future<DataState<PokemonDetail>> mShim({
  required DetailParams params,
}) async {
  return DataSuccess(tPokemon);
}

@GenerateMocks([], customMocks: [
  MockSpec<PokemonRepository>(
    as: #MockPokemonRepository,
  )
])
void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonDetailUsecase usecase;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonDetailUsecase(mockPokemonRepository);
  });

  test(
    'should get a pokemon detail by id',
    () async {
      // arrange
      final DataState<PokemonDetail> response = DataSuccess(tPokemon);
      when(mockPokemonRepository.getPokemon(id: 1))
          .thenAnswer((_) async => response);

      // act
      final result = await usecase(params: params);

      //assert
      expect(result, response);
      verify(mockPokemonRepository.getPokemon(id: 1));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
