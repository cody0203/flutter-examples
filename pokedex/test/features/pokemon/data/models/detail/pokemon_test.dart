import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/data/models/detail/pokemon.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../mocks/pokemon.dart';

void main() {
  test(
    'should be a subclass of PokemonDetailModel',
    () async {
      //assert
      expect(tPokemonDetailModel, isA<PokemonDetailModel>());
    },
  );

  group('from Json', () {
    test(
      'should return a valid PokemonDetailModel',
      () async {
        // arrange
        final Map<String, dynamic> mapJson =
            json.decode(fixture('pokemon_detail.json'));

        // act
        final result = PokemonDetailModel.fromJson(mapJson);

        //assert
        expect(result, tPokemonDetailModel);
      },
    );
  });
}
