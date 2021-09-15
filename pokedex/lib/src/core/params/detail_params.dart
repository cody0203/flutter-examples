import 'package:pokedex/src/core/enums/type.dart';

class DetailParams {
  const DetailParams({
    required this.id,
    this.type,
  });

  final int id;
  final TypeEnum? type;
}
