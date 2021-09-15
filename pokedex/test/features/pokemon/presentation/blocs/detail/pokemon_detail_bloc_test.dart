import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex/src/core/params/detail_params.dart';
import 'package:pokedex/src/core/resources/data_state.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/detail/pokemon_detail_bloc.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';

import '../../../../../mocks/common.dart';
import '../../../../../mocks/pokemon.dart';
import 'pokemon_detail_bloc_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PokemonRepository>(
    as: #MockPokemonRepository,
  )
])
void main() {
  late GetPokemonDetailUsecase usecase;
  late PokemonDetailBloc bloc;
  late MockPokemonRepository respository;

  setUp(() {
    respository = MockPokemonRepository();
    usecase = GetPokemonDetailUsecase(respository);
    bloc = PokemonDetailBloc(getPokemonDetailUsecase: usecase);
  });

  group(
    'PokemonDetailBloc',
    () {
      test(
        'Init state should be PokemonDetailInit() ',
        () async {
          //assert
          expect(bloc.state, PokemonDetailInit());
        },
      );

      blocTest<PokemonDetailBloc, PokemonDetailState>(
        'emit [PokemonDetailLoaded]'
        ' when fetching pokemon detail successful',
        build: () {
          when(usecase(params: DetailParams(id: 1)))
              .thenAnswer((_) async => DataSuccess(tPokemon));
          return bloc;
        },
        act: (bloc) => bloc.add(GetPokemonDetail(id: 1)),
        expect: () => <PokemonDetailLoaded>[
          PokemonDetailLoaded(pokemon: tPokemon),
        ],
      );

      blocTest<PokemonDetailBloc, PokemonDetailState>(
        'emit [PokemonDetailError]'
        ' when fetching pokemon throws an error',
        build: () {
          when(usecase(params: DetailParams(id: 1))).thenThrow(dioError);
          return bloc;
        },
        act: (bloc) => bloc..add(GetPokemonDetail(id: 1)),
        expect: () => [
          isA<PokemonDetailError>(),
        ],
      );
    },
  );
}
