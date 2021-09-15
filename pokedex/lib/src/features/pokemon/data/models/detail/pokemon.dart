import '../../../../../core/enums/type.dart';
import '../../../../../core/utils/mapper/mapper.dart';
import '../../../domain/entities/detail/ability.dart';
import '../../../domain/entities/detail/evolution.dart';
import '../../../domain/entities/detail/move.dart';
import '../../../domain/entities/detail/pokemon.dart';
import '../../../domain/entities/detail/sprite.dart';

class PokemonDetailModel extends PokemonDetail {
  const PokemonDetailModel({
    required int id,
    required String name,
    required String avatar,
    required List<Ability> abilities,
    required String atk,
    required String catchRate,
    required String cp,
    required String def,
    required String sta,
    required List<Evolution> evolutions,
    required String fieldFleeRate,
    required String fieldPokemonGeneration,
    required List<TypeEnum?> fieldPokemonTypes,
    required List<PokemonMove> moves,
    required Sprite sprite,
  }) : super(
          id: id,
          name: name,
          avatar: avatar,
          abilities: abilities,
          atk: atk,
          catchRate: catchRate,
          cp: cp,
          def: def,
          evolutions: evolutions,
          fieldFleeRate: fieldFleeRate,
          fieldPokemonGeneration: fieldPokemonGeneration,
          fieldPokemonTypes: fieldPokemonTypes,
          moves: moves,
          sprite: sprite,
          sta: sta,
        );

  factory PokemonDetailModel.fromJson(Map<String, dynamic> mapJson) {
    final Mapper<TypeEnum?> mapper = Mapper<TypeEnum?>(
      source: mapJson,
      sourceField: 'field_pokemon_type',
      sourceMap: mapTypeToTypeEnum,
    );

    final List<TypeEnum?> fieldPokemonType = mapper.mapJsonToList();
    fieldPokemonType.removeWhere((dynamic value) => value == null);

    return PokemonDetailModel(
      id: mapJson['id'] as int,
      name: mapJson['name'] as String,
      avatar: mapJson['avatar'] as String,
      abilities: List<dynamic>.from(mapJson['abilities'] as List<dynamic>)
          .map(
            (dynamic ability) => Ability(
              name: ability['name'] as String,
              id: ability['id'] as int,
              effectEntries: List<dynamic>.from(
                ability['effect_entries'] as List<dynamic>,
              )
                  .map(
                    (dynamic effectEntry) => EffectEntry(
                      effect: effectEntry['effect'] as String,
                      shortEffect: effectEntry['short_effect'] as String,
                    ),
                  )
                  .toList(),
              isHidden: ability['is_hidden'] as bool,
            ),
          )
          .toList(),
      atk: mapJson['atk'] as String,
      catchRate: mapJson['catch_rate'] as String,
      cp: mapJson['cp'] as String,
      def: mapJson['def'] as String,
      evolutions: List<dynamic>.from(mapJson['evolutions'] as List<dynamic>)
          .map(
            (dynamic evolution) => Evolution(
              id: evolution['id'] as int,
              name: evolution['name'] as String,
              avatar: evolution['avatar'] as String,
            ),
          )
          .toList(),
      fieldFleeRate: mapJson['field_flee_rate'] as String,
      fieldPokemonGeneration: mapJson['field_pokemon_generation'] as String,
      fieldPokemonTypes: fieldPokemonType,
      sta: mapJson['sta'] as String,
      moves: List<dynamic>.from(mapJson['moves'] as List<dynamic>)
          .map(
            (dynamic move) => PokemonMove(
              id: move['id'] as int,
              name: move['name'] as String,
              power: move['power'] as int,
              pp: move['pp'] as int,
              type: (move['type'] as String).isNotEmpty
                  ? mapTypeToTypeEnum[move['type']]
                  : TypeEnum.unknown,
            ),
          )
          .toList(),
      sprite: Sprite(
        backDefault: mapJson['sprites']['back_default'] as String,
        backFemale: mapJson['sprites']['back_female'] as String,
        backShiny: mapJson['sprites']['back_shiny'] as String,
        backShinyFemale: mapJson['sprites']['back_shiny_female'] as String,
        frontDefault: mapJson['sprites']['front_default'] as String,
        frontFemale: mapJson['sprites']['front_female'] as String,
        frontShiny: mapJson['sprites']['front_shiny'] as String,
        frontShinyFemale: mapJson['sprites']['front_shiny_female'] as String,
      ),
    );
  }
}
