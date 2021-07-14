import '../../core/params/article_request_params.dart';
import '../../core/resource/datastate.dart';
import '../../core/usecase/usecase.dart';
import '../entities/article.dart';
import '../repositories/article_repository.dart';

class GetArticlesUsecase
    implements Usecase<DataState<List<Article>>, ArticleRequestParams> {
  final ArticleRepository _articleRepository;
  GetArticlesUsecase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call({
    required ArticleRequestParams params,
  }) {
    return _articleRepository.getTopHeadlines(params);
  }
}
