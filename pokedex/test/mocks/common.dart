import 'package:dio/dio.dart';

final DioError dioError = DioError(
  type: DioErrorType.response,
  requestOptions: RequestOptions(path: '/pokemons'),
);
