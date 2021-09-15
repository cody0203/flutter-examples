import 'package:equatable/equatable.dart';

class Evolution extends Equatable {
  const Evolution({
    required this.id,
    required this.name,
    required this.avatar,
  });
  final int id;
  final String name;
  final String avatar;

  @override
  List<Object> get props => <Object>[
        id,
        name,
        avatar,
      ];
}
