import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../core/bloc/bloc_with_state.dart';
import '../../core/params/article_request_params.dart';
import '../../core/resource/datastate.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_articles_usecase.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends BlocWithState<ArticlesEvent, ArticlesState> {
  final GetArticlesUsecase _getArticlesUsecase;
  ArticlesBloc(this._getArticlesUsecase) : super(const ArticlesLoading());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is GetArticles) {
      yield* _getTopHeadlinesArticle(event);
    }
  }

  Stream<ArticlesState> _getTopHeadlinesArticle(ArticlesEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getArticlesUsecase(
        params: ArticleRequestParams(
          page: _page,
        ),
      );

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final articles = dataState.data;
        final noMoreData = articles!.length < _pageSize;
        _articles.addAll(articles);
        _page++;
        yield ArticlesDone(
          articles: _articles,
          noMoreData: noMoreData,
        );
      }

      if (dataState is DataFailure) {
        yield ArticlesError(dataState.error!);
      }
    });
  }
}
