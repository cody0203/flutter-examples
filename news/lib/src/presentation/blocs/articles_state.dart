part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  final List<Article>? articles;
  final bool? noMoreData;
  final DioError? error;

  const ArticlesState({
    this.articles,
    this.noMoreData,
    this.error,
  });

  List<Object?> get props => [
        articles,
        noMoreData,
        error,
      ];
}

class ArticlesLoading extends ArticlesState {
  const ArticlesLoading();
}

class ArticlesDone extends ArticlesState {
  const ArticlesDone({
    required List<Article> articles,
    required bool noMoreData,
  }) : super(
          articles: articles,
          noMoreData: noMoreData,
        );
}

class ArticlesError extends ArticlesState {
  const ArticlesError(DioError error) : super(error: error);
}
