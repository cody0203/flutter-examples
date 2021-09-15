import 'package:equatable/equatable.dart';

class MoveDetail extends Equatable {
  const MoveDetail({
    required this.id,
    required this.name,
    required this.effectEntry,
    required this.power,
    required this.accuracy,
    required this.pp,
    required this.type,
  });
  final int id;
  final String name;
  final String effectEntry;
  final int power;
  final int accuracy;
  final int pp;
  final String type;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        effectEntry,
        power,
        accuracy,
        pp,
        type,
      ];
}
