import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon_list.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../mocks/pokemon.dart';

void main() {
  test(
    'should be a subclass of PokemonList Model',
    () async {
      //assert

      expect(tPokemonListModel, isA<PokemonListModel>());
    },
  );

  group('from Json', () {
    test(
      'should return a valid PokemonList Model',
      () async {
        // arrange
        final Map<String, dynamic> mapJson =
            json.decode(fixture('pokemon_list.json'));
        // act
        final result = PokemonListModel.fromJson(mapJson);

        //assert
        expect(result, tPokemonListModel);
      },
    );
  });
}
