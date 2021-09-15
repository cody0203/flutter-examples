import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex/src/core/resources/data_state.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokedex/src/core/params/list_params.dart';

import '../../../../mocks/pokemon.dart';

import 'get_pokemon_list_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PokemonRepository>(
    as: #MockPokemonRepository,
  )
])
void main() {
  late GetPokemonListUsecase usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonListUsecase(mockPokemonRepository);
  });

  test(
    'should get pokemon list from the repository',
    () async {
      // arrange
      final DataState<PokemonList> response = DataSuccess(tPokemonList);
      when(mockPokemonRepository.getPokemonList(page: 1))
          .thenAnswer((_) async => response);

      // act
      final DataState<PokemonList> result = await usecase(
        params: ListParams(
          page: 1,
        ),
      );

      //assert
      expect(result, response);
      verify(mockPokemonRepository.getPokemonList(page: 1));
      verifyNoMoreInteractions(mockPokemonRepository);
    },
  );
}
