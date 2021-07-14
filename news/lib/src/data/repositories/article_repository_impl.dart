import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/params/article_request_params.dart';
import '../../core/resource/datastate.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasource/top_headlines_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final TopHeadlinesService _topHeadlinesService;
  ArticleRepositoryImpl(this._topHeadlinesService);

  @override
  Future<DataState<List<Article>>> getTopHeadlines(
    ArticleRequestParams params,
  ) async {
    try {
      final httpResponse = await _topHeadlinesService.getTopHeadlinesArticles(
        apiKey: params.apiKey,
        country: params.country,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }

      return DataFailure(
        DioError(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response,
          type: DioErrorType.response,
          response: httpResponse.response,
        ),
      );
    } on DioError catch (error) {
      return DataFailure(error);
    }
  }
}
