import 'article_model.dart';

class TopHeadlinesModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  const TopHeadlinesModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory TopHeadlinesModel.fromJson(Map<String, dynamic> data) {
    return TopHeadlinesModel(
      status: data['status'] as String,
      totalResults: data['totalResults'] as int,
      articles: List<dynamic>.from(
        data['articles'] as List<dynamic>,
      )
          .map(
            (article) => ArticleModel.fromJson(
              article as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}
