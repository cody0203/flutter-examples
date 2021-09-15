import 'package:flutter/material.dart';

enum TypeEnum {
  grass,
  poison,
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  ground,
  ice,
  normal,
  psychic,
  rock,
  steel,
  water,
  unknown,
}

Map<TypeEnum, String> mapTypeEnumToType = {
  TypeEnum.grass: 'Grass',
  TypeEnum.poison: 'Poison',
  TypeEnum.bug: 'Bug',
  TypeEnum.dark: 'Dark',
  TypeEnum.dragon: 'Dragon',
  TypeEnum.electric: 'Electric',
  TypeEnum.fairy: 'Fairy',
  TypeEnum.fighting: 'Fighting',
  TypeEnum.fire: 'Fire',
  TypeEnum.flying: 'Flying',
  TypeEnum.ghost: 'Ghost',
  TypeEnum.ground: 'Ground',
  TypeEnum.ice: 'Ice',
  TypeEnum.normal: 'Normal',
  TypeEnum.psychic: 'Psychic',
  TypeEnum.rock: 'Rock',
  TypeEnum.steel: 'Steel',
  TypeEnum.water: 'Water',
  TypeEnum.unknown: 'Unknown',
};

Map<String, TypeEnum> mapTypeToTypeEnum = {
  'Grass': TypeEnum.grass,
  'Poison': TypeEnum.poison,
  'Bug': TypeEnum.bug,
  'Dark': TypeEnum.dark,
  'Dragon': TypeEnum.dragon,
  'Electric': TypeEnum.electric,
  'Fairy': TypeEnum.fairy,
  'Fighting': TypeEnum.fighting,
  'Fire': TypeEnum.fire,
  'Flying': TypeEnum.flying,
  'Ghost': TypeEnum.ghost,
  'Ground': TypeEnum.ground,
  'Ice': TypeEnum.ice,
  'Normal': TypeEnum.normal,
  'Psychic': TypeEnum.psychic,
  'Rock': TypeEnum.rock,
  'Steel': TypeEnum.steel,
  'Water': TypeEnum.water,
  'Unknown': TypeEnum.unknown,
};

Map<TypeEnum, String> mapTypeEnumToTypeImage = {
  TypeEnum.grass: 'assets/images/types/grass.png',
  TypeEnum.poison: 'assets/images/types/poison.png',
  TypeEnum.bug: 'assets/images/types/bug.png',
  TypeEnum.dark: 'assets/images/types/dark.png',
  TypeEnum.dragon: 'assets/images/types/dragon.png',
  TypeEnum.electric: 'assets/images/types/electric.png',
  TypeEnum.fairy: 'assets/images/types/fairy.png',
  TypeEnum.fighting: 'assets/images/types/fighting.png',
  TypeEnum.fire: 'assets/images/types/fire.png',
  TypeEnum.flying: 'assets/images/types/flying.png',
  TypeEnum.ghost: 'assets/images/types/ghost.png',
  TypeEnum.ground: 'assets/images/types/ground.png',
  TypeEnum.ice: 'assets/images/types/ice.png',
  TypeEnum.normal: 'assets/images/types/normal.png',
  TypeEnum.psychic: 'assets/images/types/psychic.png',
  TypeEnum.rock: 'assets/images/types/rock.png',
  TypeEnum.steel: 'assets/images/types/steel.png',
  TypeEnum.water: 'assets/images/types/water.png',
  TypeEnum.unknown: 'assets/images/types/unknown.png',
};

Map<TypeEnum, List<Color>> mapTypeEnumToGradientColor = {
  TypeEnum.grass: const <Color>[
    Color.fromRGBO(95, 188, 81, 1),
    Color.fromRGBO(90, 193, 120, 1),
  ],
  TypeEnum.poison: const <Color>[
    Color.fromRGBO(168, 100, 199, 1),
    Color.fromRGBO(194, 97, 212, 1),
  ],
  TypeEnum.bug: const <Color>[
    Color.fromRGBO(146, 188, 44, 1),
    Color.fromRGBO(175, 200, 54, 1),
  ], 
  TypeEnum.dark: const <Color>[
    Color.fromRGBO(89, 87, 97, 1),
    Color.fromRGBO(110, 117, 135, 1),
  ],
  TypeEnum.dragon: const <Color>[
    Color.fromRGBO(12, 105, 200, 1),
    Color.fromRGBO(1, 128, 199, 1),
  ],
  TypeEnum.electric: const <Color>[
    Color.fromRGBO(237, 213, 62, 1),
    Color.fromRGBO(251, 226, 115, 1),
  ],
  TypeEnum.fairy: const <Color>[
    Color.fromRGBO(236, 140, 229, 1),
    Color.fromRGBO(243, 167, 231, 1),
  ],
  TypeEnum.fighting: const <Color>[
    Color.fromRGBO(206, 66, 101, 1),
    Color.fromRGBO(231, 67, 71, 1),
  ],
  TypeEnum.fire: const <Color>[
    Color.fromRGBO(251, 155, 81, 1),
    Color.fromRGBO(251, 174, 70, 1),
  ],
  TypeEnum.flying: const <Color>[
    Color.fromRGBO(144, 167, 218, 1),
    Color.fromRGBO(166, 194, 242, 1),
  ],
  TypeEnum.ghost: const <Color>[
    Color.fromRGBO(81, 106, 172, 1),
    Color.fromRGBO(119, 115, 212, 1),
  ],
  TypeEnum.ground: const <Color>[
    Color.fromRGBO(220, 117, 69, 1),
    Color.fromRGBO(210, 148, 99, 1),
  ],
  TypeEnum.ice: const <Color>[
    Color.fromRGBO(112, 204, 189, 1),
    Color.fromRGBO(140, 221, 212, 1),
  ],
  TypeEnum.normal: const <Color>[
    Color.fromRGBO(146, 152, 164, 1),
    Color.fromRGBO(163, 164, 158, 1),
  ],
  TypeEnum.psychic: const <Color>[
    Color.fromRGBO(246, 111, 113, 1),
    Color.fromRGBO(254, 159, 146, 1),
  ],
  TypeEnum.rock: const <Color>[
    Color.fromRGBO(197, 180, 137, 1),
    Color.fromRGBO(215, 205, 144, 1),
  ],
  TypeEnum.steel: const <Color>[
    Color.fromRGBO(82, 134, 157, 1),
    Color.fromRGBO(88, 166, 170, 1),
  ],
  TypeEnum.water: const <Color>[
    Color.fromRGBO(85, 158, 223, 1),
    Color.fromRGBO(105, 185, 227, 1),
  ],
  TypeEnum.unknown: const <Color>[
    Color.fromRGBO(146, 152, 164, 1),
    Color.fromRGBO(163, 164, 158, 1),
  ],
};
