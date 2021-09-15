import 'package:equatable/equatable.dart';

import '../../../../../core/enums/type.dart';
import 'ability.dart';
import 'evolution.dart';
import 'move.dart';
import 'sprite.dart';

class PokemonDetail extends Equatable {
  const PokemonDetail({
    required this.id,
    required this.avatar,
    required this.name,
    required this.sta,
    required this.atk,
    required this.def,
    required this.cp,
    required this.catchRate,
    required this.fieldFleeRate,
    required this.fieldPokemonGeneration,
    required this.sprite,
    required this.fieldPokemonTypes,
    required this.evolutions,
    required this.abilities,
    required this.moves,
  });
  final int id;
  final String avatar;
  final String name;
  final String sta;
  final String atk;
  final String def;
  final String cp;
  final String catchRate;
  final String fieldFleeRate;
  final String fieldPokemonGeneration;
  final Sprite sprite;
  final List<TypeEnum?> fieldPokemonTypes;
  final List<Evolution> evolutions;
  final List<Ability> abilities;
  final List<PokemonMove> moves;

  @override
  List<Object> get props => <Object>[
        id,
        avatar,
        name,
        sta,
        atk,
        def,
        cp,
        catchRate,
        fieldFleeRate,
        fieldPokemonGeneration,
        sprite,
        fieldPokemonTypes,
        evolutions,
        abilities,
        moves,
      ];
}
