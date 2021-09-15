import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/list/pokemon_list_bloc.dart';

void main() {
  group('PokemonListEvent', () {
    group('GetPokemonList', () {
      test('supports value comparison', () {
        expect(GetPokemonList(page: 1), GetPokemonList(page: 1));
      });
    });
  });
}
