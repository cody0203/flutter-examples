import 'package:equatable/equatable.dart';

class ItemInList extends Equatable {
  const ItemInList({
    required this.id,
    required this.name,
    required this.avatar,
    required this.cost,
  });
  final int id;
  final String name;
  final String avatar;
  final int cost;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        avatar,
        cost,
      ];
}
