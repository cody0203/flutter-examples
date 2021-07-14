import 'package:news/src/data/models/source_model.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/source.dart';

class ArticleModel extends Article {
  const ArticleModel({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> data) {
    return ArticleModel(
      source: SourceModel.fromJson(data['source']),
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      urlToImage: data['urlToImage'],
      publishedAt: data['publishedAt'],
      content: data['content'],
    );
  }
}
