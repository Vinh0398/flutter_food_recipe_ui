abstract class BaseUseCase<T, G> {
  Future<T> invoke({required G param});
}
