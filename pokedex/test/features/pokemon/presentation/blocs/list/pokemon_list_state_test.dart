import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/list/pokemon_list_bloc.dart';

import '../../../../../mocks/common.dart';
import '../../../../../mocks/pokemon.dart';

void main() {
  group('PokemonListState', () {
    group('PokemonListInit', () {
      test('support value comparison', () {
        expect(PokemonListInit(), PokemonListInit());
      });
    });

    group('PokemonListLoaded', () {
      test(
        'support value comparison',
        () {
          expect(PokemonListLoaded(pokemonList: tPokemonList),
              PokemonListLoaded(pokemonList: tPokemonList));
        },
      );
    });

    group('PokemonListError', () {
      test('support value comparison', () {
        expect(PokemonListError(error: dioError),
            PokemonListError(error: dioError));
      });
    });
  });
}
