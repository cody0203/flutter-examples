import 'package:news/src/core/constants/article_constants.dart';

class ArticleRequestParams {
  final String apiKey;
  final String country;
  final int page;
  final int pageSize;

  const ArticleRequestParams({
    this.apiKey = kApiKey,
    this.country = 'us',
    this.page = 1,
    this.pageSize = 20,
  });
}
