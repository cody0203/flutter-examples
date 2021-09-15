import 'package:equatable/equatable.dart';

class EffectEntry extends Equatable {
  const EffectEntry({
    required this.effect,
    required this.shortEffect,
  });
  final String effect;
  final String shortEffect;

  @override
  List<Object> get props => <Object>[
        effect,
        shortEffect,
      ];
}

class Ability extends Equatable {
  const Ability({
    required this.name,
    required this.id,
    required this.effectEntries,
    required this.isHidden,
  });
  final int id;
  final String name;
  final List<EffectEntry> effectEntries;
  final bool isHidden;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        effectEntries,
        isHidden,
      ];
}
