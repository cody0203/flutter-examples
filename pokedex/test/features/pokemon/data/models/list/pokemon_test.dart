import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../mocks/pokemon.dart';

void main() {
  test(
    'should be a subclass of PokemonInList Model',
    () async {
      //assert
      expect(tPokemonInListModel, isA<PokemonInListModel>());
    },
  );

  group(
    'from Json',
    () {
      test(
        'should return a valid PokemonInList Model',
        () async {
          // arrange
          final Map<String, dynamic> mapJson =
              json.decode(fixture('pokemon_in_list.json'));

          // act
          final result = PokemonInListModel.fromJson(mapJson);

          //assert
          expect(result, tPokemonInListModel);
        },
      );
    },
  );
}
