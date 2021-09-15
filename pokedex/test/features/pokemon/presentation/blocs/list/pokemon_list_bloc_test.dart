import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex/src/core/params/list_params.dart';
import 'package:pokedex/src/core/resources/data_state.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/list/pokemon_list_bloc.dart';

import '../../../../../mocks/common.dart';
import '../../../../../mocks/pokemon.dart';
import 'pokemon_list_bloc_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PokemonRepository>(
    as: #MockPokemonRepository,
  )
])
void main() {
  late GetPokemonListUsecase usecase;
  late PokemonListBloc bloc;
  late MockPokemonRepository respository;

  setUp(() {
    respository = MockPokemonRepository();
    usecase = GetPokemonListUsecase(respository);
    bloc = PokemonListBloc(getPokemonListUsecase: usecase);
  });

  group('PokemonListBloc', () {
    test(
      'initial state should be PokemonListInit()',
      () async {
        //assert
        expect(bloc.state, PokemonListInit());
      },
    );

    blocTest<PokemonListBloc, PokemonListState>(
      'emit [PokemonListLoaded] '
      'when fetching pokemon list loaded successfully',
      build: () {
        when(usecase(params: ListParams(page: 1))).thenAnswer(
          (_) async => DataSuccess(tPokemonList),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(GetPokemonList(page: 1)),
      expect: () => <PokemonListLoaded>[
        PokemonListLoaded(pokemonList: tPokemonList),
      ],
    );

    blocTest<PokemonListBloc, PokemonListState>(
      'emit [PokemonListError] '
      'when fetching pokemon list throws an error',
      build: () {
        when(usecase(params: ListParams(page: 1))).thenThrow(dioError);
        return bloc;
      },
      act: (bloc) => bloc..add(GetPokemonList(page: 1)),
      expect: () => [
        isA<PokemonListError>(),
      ],
    );
  });
}
