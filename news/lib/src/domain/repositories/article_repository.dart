import 'package:news/src/core/resource/datastate.dart';

import '../../core/params/article_request_params.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<Article>>> getTopHeadlines(
    ArticleRequestParams params,
  );
}
