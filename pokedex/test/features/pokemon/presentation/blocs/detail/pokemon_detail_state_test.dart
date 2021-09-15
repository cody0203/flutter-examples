import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/src/features/pokemon/presentation/blocs/detail/pokemon_detail_bloc.dart';
import '../../../../../mocks/common.dart';
import '../../../../../mocks/pokemon.dart';

void main() {
  group('PokemonDetailState', () {
    group('PokemonDetailInit', () {
      test(
        'support value comparison ',
        () async {
          //assert
          expect(PokemonDetailInit(), PokemonDetailInit());
        },
      );
    });

    group('PokemonDetailLoaded', () {
      test(
        'support value comparison ',
        () async {
          //assert
          expect(PokemonDetailLoaded(pokemon: tPokemon),
              PokemonDetailLoaded(pokemon: tPokemon));
        },
      );
    });
    group('PokemonDetailError', () {
      test('support value comparison', () {
        expect(PokemonDetailError(error: dioError),
            PokemonDetailError(error: dioError));
      });
    });
  });
}
