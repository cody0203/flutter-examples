import 'package:equatable/equatable.dart';

class ItemDetail extends Equatable {
  const ItemDetail({
    required this.id,
    required this.name,
    required this.cost,
    required this.effectEntry,
    required this.sprite,
  });
  final int id;
  final String name;
  final int cost;
  final String effectEntry;
  final String sprite;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        cost,
        effectEntry,
        sprite,
      ];
}
