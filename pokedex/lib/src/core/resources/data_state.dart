import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  const DataState({
    this.data,
    this.error,
  });
  final T? data;
  final DioError? error;

  @override
  List<Object?> get props => <Object?>[
        data,
        error,
      ];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(DioError error) : super(error: error);
}
