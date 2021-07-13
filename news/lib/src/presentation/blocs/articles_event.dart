part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  List<Object> get props => [];
}

class GetArticles extends ArticlesEvent {
  const GetArticles();
}
