import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/pokemon.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/sprite.dart';
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon.dart';
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/data/models/detail/pokemon.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/ability.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/evolution.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/move.dart';

import 'package:pokedex/src/core/enums/type.dart';

final List<PokemonInList> tPokemonInList = [
  PokemonInList(
    id: 1,
    name: 'Bulbasaur',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
    fieldPokemonType: [
      TypeEnum.grass,
      TypeEnum.poison,
    ],
  ),
  PokemonInList(
    id: 2,
    name: 'Ivysaur',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/2.png',
    fieldPokemonType: [
      TypeEnum.grass,
      TypeEnum.poison,
    ],
  ),
  PokemonInList(
    id: 3,
    name: 'Venusaur',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/3.png',
    fieldPokemonType: [
      TypeEnum.grass,
      TypeEnum.poison,
    ],
  ),
  PokemonInList(
    id: 4,
    name: 'Charmander',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/4.png',
    fieldPokemonType: [
      TypeEnum.fire,
    ],
  ),
  PokemonInList(
    id: 5,
    name: 'Charmeleon',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/5.png',
    fieldPokemonType: [
      TypeEnum.fire,
    ],
  ),
  PokemonInList(
    id: 6,
    name: 'Charmeleon',
    avatar:
        'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/6.png',
    fieldPokemonType: [
      TypeEnum.fire,
      TypeEnum.flying,
    ],
  ),
];

final PokemonList tPokemonList = PokemonList(
  totalPages: 10,
  currentPage: 1,
  pokemons: tPokemonInList,
);

final PokemonList tEmptyPokemonList = PokemonList(
  totalPages: 1,
  currentPage: 1,
  pokemons: [],
);

final PokemonInListModel tPokemonInListModel = PokemonInListModel(
  id: 1,
  name: 'Bulbasaur',
  avatar:
      'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
  fieldPokemonType: [
    TypeEnum.grass,
    TypeEnum.poison,
  ],
);

final PokemonListModel tPokemonListModel = PokemonListModel(
  currentPage: 1,
  totalPages: 10,
  pokemons: [
    tPokemonInListModel,
  ],
);

final PokemonDetailModel tPokemonDetailModel = PokemonDetailModel(
  id: 1,
  avatar:
      'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
  name: 'Bulbasaur',
  sta: '128',
  atk: '118',
  def: '111',
  cp: '1115',
  catchRate: '20.00 %',
  fieldFleeRate: '10.00 %',
  fieldPokemonGeneration: 'Generation 1',
  abilities: [
    Ability(
      id: 34,
      isHidden: true,
      name: 'Chlorophyll',
      effectEntries: [
        EffectEntry(
          effect:
              'This Pokémon\'s Speed is doubled during strong sunlight.\n\nThis bonus does not count as a stat modifier.',
          shortEffect: 'Doubles Speed during strong sunlight.',
        )
      ],
    ),
    Ability(
      id: 65,
      isHidden: false,
      name: 'Overgrow',
      effectEntries: [
        EffectEntry(
          effect:
              'When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage.',
          shortEffect:
              'Strengthens grass moves to inflict 1.5× damage at 1/3 max HP or less.',
        )
      ],
    ),
  ],
  evolutions: [
    Evolution(
      id: 1,
      name: 'Bulbasaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
    ),
    Evolution(
      id: 2,
      name: 'Ivysaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/2.png',
    ),
    Evolution(
      id: 3,
      name: 'Venusaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/3.png',
    ),
  ],
  fieldPokemonTypes: [
    TypeEnum.grass,
    TypeEnum.poison,
  ],
  moves: [
    PokemonMove(
      id: 13,
      name: 'Razor Wind',
      power: 80,
      pp: 10,
      type: TypeEnum.normal,
    ),
    PokemonMove(
      id: 14,
      name: 'Swords Dance',
      power: 0,
      pp: 20,
      type: TypeEnum.normal,
    ),
  ],
  sprite: Sprite(
    backDefault:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png',
    backFemale: '',
    backShiny:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png',
    backShinyFemale: '',
    frontDefault:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    frontFemale: '',
    frontShiny:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png',
    frontShinyFemale: '',
  ),
);

final PokemonDetail tPokemon = PokemonDetail(
  id: 1,
  avatar:
      'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
  name: 'Bulbasaur',
  sta: '128',
  atk: '118',
  def: '111',
  cp: '1115',
  catchRate: '20.00 %',
  fieldFleeRate: '10.00 %',
  fieldPokemonGeneration: 'Generation 1',
  abilities: [
    Ability(
      id: 34,
      isHidden: true,
      name: 'Chlorophyll',
      effectEntries: [
        EffectEntry(
          effect:
              'This Pokémon\'s Speed is doubled during strong sunlight.\n\nThis bonus does not count as a stat modifier.',
          shortEffect: 'Doubles Speed during strong sunlight.',
        )
      ],
    ),
    Ability(
      id: 65,
      isHidden: false,
      name: 'Overgrow',
      effectEntries: [
        EffectEntry(
          effect:
              'When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage.',
          shortEffect:
              'Strengthens grass moves to inflict 1.5× damage at 1/3 max HP or less.',
        )
      ],
    ),
  ],
  evolutions: [
    Evolution(
      id: 1,
      name: 'Bulbasaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/1_0.png',
    ),
    Evolution(
      id: 2,
      name: 'Ivysaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-08/2.png',
    ),
    Evolution(
      id: 3,
      name: 'Venusaur',
      avatar:
          'https://gamepress.gg/pokemongo/sites/pokemongo/files/2016-07/3.png',
    ),
  ],
  fieldPokemonTypes: [
    TypeEnum.grass,
    TypeEnum.poison,
  ],
  moves: [
    PokemonMove(
      id: 13,
      name: 'Razor Wind',
      power: 80,
      pp: 10,
      type: TypeEnum.normal,
    ),
    PokemonMove(
      id: 14,
      name: 'Swords Dance',
      power: 0,
      pp: 20,
      type: TypeEnum.normal,
    ),
  ],
  sprite: Sprite(
    backDefault:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png',
    backFemale: '',
    backShiny:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png',
    backShinyFemale: '',
    frontDefault:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    frontFemale: '',
    frontShiny:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png',
    frontShinyFemale: '',
  ),
);
