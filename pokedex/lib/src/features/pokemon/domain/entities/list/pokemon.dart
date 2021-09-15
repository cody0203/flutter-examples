import 'package:equatable/equatable.dart';
import 'package:pokedex/src/core/enums/type.dart';

class PokemonInList extends Equatable {
  const PokemonInList({
    required this.id,
    required this.name,
    required this.avatar,
    required this.fieldPokemonType,
  });
  final int id;
  final String name;
  final String avatar;
  final List<TypeEnum?> fieldPokemonType;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        avatar,
        fieldPokemonType,
      ];
}
