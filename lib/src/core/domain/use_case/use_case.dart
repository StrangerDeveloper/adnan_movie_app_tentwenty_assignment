/// Base interface for Use Cases
/// Follows Clean Architecture pattern
abstract class UseCase<Result, Params> {
  Future<Result> call({Params? params});
}
