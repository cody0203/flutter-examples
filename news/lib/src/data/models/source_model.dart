import '../../domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
    String? id,
    String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> data) {
    return SourceModel(
      id: data['id'].toString(),
      name: data['name'].toString(),
    );
  }
}
