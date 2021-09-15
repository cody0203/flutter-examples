import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/src/features/pokemon/presentation/blocs/detail/pokemon_detail_bloc.dart';

void main() {
  group('PokemonListEvent', () {
    group('GetPokemonDetail', () {
      test('supports value comparison', () {
        expect(GetPokemonDetail(id: 1), GetPokemonDetail(id: 1));
      });
    });
  });
}
