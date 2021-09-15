class Mapper<T> {
  const Mapper({
    required this.source,
    this.sourceField,
    required this.sourceMap,
  });
  final dynamic source;
  final String? sourceField;
  final Map<dynamic, dynamic> sourceMap;

  List<T> mapJsonToList() {
    final List<T> types = (source[sourceField] as List<dynamic>)
        .map((dynamic type) => sourceMap[type] as T)
        .toList();
    return types;
  }

  List<T> mapObjectToList() {
    try {
      final List<T> types = (source as List<dynamic>)
          .map((dynamic type) => sourceMap[type] as T)
          .toList();
      return types;
    } catch (error) {
      return [];
    }
  }
}
