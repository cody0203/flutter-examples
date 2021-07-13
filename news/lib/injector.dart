import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/src/data/datasource/top_headlines_service.dart';
import 'package:news/src/data/repositories/article_repository_impl.dart';
import 'package:news/src/domain/repositories/article_repository.dart';
import 'package:news/src/domain/usecases/get_articles_usecase.dart';
import 'package:news/src/presentation/blocs/articles_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register http client (Dio)
  injector.registerSingleton<Dio>(Dio());

  // Register dependencies
  injector
      .registerSingleton<TopHeadlinesService>(TopHeadlinesService(injector()));
  injector
      .registerSingleton<ArticleRepository>(ArticleRepositoryImpl(injector()));

  // Register usecase
  injector
      .registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(injector()));

  // Register bloc
  injector.registerFactory(() => ArticlesBloc(injector()));
}
