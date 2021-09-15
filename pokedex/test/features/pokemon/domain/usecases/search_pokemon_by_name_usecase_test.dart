import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex/src/core/resources/data_state.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/search_pokemon_by_name_usecase.dart';
import 'package:pokedex/src/core/params/search_params.dart';

import '../../../../mocks/pokemon.dart';
import 'search_pokemon_by_name_usecase_test.mocks.dart';

final SearchParams params = SearchParams(name: 'Pikachu');

Future<DataState<PokemonList>> mShim({
  required SearchParams params,
}) async {
  return DataSuccess(tPokemonList);
}

@GenerateMocks([], customMocks: [
  MockSpec<PokemonRepository>(
    as: #MockPokemonRepository,
  )
])
void main() {
  late SearchPokemonByNameUsecase usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = SearchPokemonByNameUsecase(mockPokemonRepository);
  });

  test(
    'should get pokemon pokemon list by name',
    () async {
      // arrange
      final DataState<PokemonList> response = DataSuccess(tPokemonList);
      when(mockPokemonRepository.searchPokemonByName(params: params))
          .thenAnswer((_) async => response);

      // act
      final result = await usecase(params: params);

      //assert
      expect(result, response);
      verify(mockPokemonRepository.searchPokemonByName(params: params));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
