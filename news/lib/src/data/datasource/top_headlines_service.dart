import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/article_constants.dart';
import '../models/top_headlines_model.dart';

part 'top_headlines_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TopHeadlinesService {
  factory TopHeadlinesService(
    Dio dio, {
    String baseUrl,
  }) = _TopHeadlinesService;

  @GET('/top-headlines')
  Future<HttpResponse<TopHeadlinesModel>> getTopHeadlinesArticles({
    @Query('apiKey') required String apiKey,
    @Query('country') required String country,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });
}
