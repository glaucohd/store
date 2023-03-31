import '../entities/product_entity.dart';

abstract class GetProductsUsecase {
  Future<List<ProductEntity>> call();
}
