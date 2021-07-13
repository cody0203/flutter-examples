abstract class Usecase<T, P> {
  Future<T> call({required P params});
}
