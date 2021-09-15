import 'package:equatable/equatable.dart';

class MoveInList extends Equatable {
  const MoveInList({
    required this.id,
    required this.name,
    required this.type,
  });
  final int id;
  final String name;
  final String type;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        type,
      ];
}
