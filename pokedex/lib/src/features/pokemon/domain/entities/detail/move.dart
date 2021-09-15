import 'package:equatable/equatable.dart';
import 'package:pokedex/src/core/enums/type.dart';

class PokemonMove extends Equatable {
  const PokemonMove({
    required this.id,
    required this.name,
    required this.type,
    required this.power,
    required this.pp,
  });
  final int id;
  final String name;
  final TypeEnum? type;
  final int power;
  final int pp;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        type,
        power,
        pp,
      ];
}
