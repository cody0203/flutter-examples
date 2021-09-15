import '../../../../../core/enums/type.dart';
import '../../../../../core/utils/mapper/mapper.dart';
import '../../../domain/entities/list/pokemon.dart';

class PokemonInListModel extends PokemonInList {
  const PokemonInListModel({
    required int id,
    required String name,
    required String avatar,
    required List<TypeEnum?> fieldPokemonType,
  }) : super(
          id: id,
          name: name,
          avatar: avatar,
          fieldPokemonType: fieldPokemonType,
        );

  factory PokemonInListModel.fromJson(Map<String, dynamic> mapJson) {
    final Mapper<TypeEnum?> mapper = Mapper<TypeEnum?>(
      source: mapJson,
      sourceField: 'field_pokemon_type',
      sourceMap: mapTypeToTypeEnum,
    );

    final List<TypeEnum?> fieldPokemonType = mapper.mapJsonToList();
    fieldPokemonType.removeWhere((dynamic value) => value == null);

    return PokemonInListModel(
      id: mapJson['id'] as int,
      name: mapJson['name'] as String,
      avatar: mapJson['avatar'] as String,
      fieldPokemonType: fieldPokemonType.isEmpty
          ? <TypeEnum>[TypeEnum.unknown]
          : fieldPokemonType,
    );
  }
}
