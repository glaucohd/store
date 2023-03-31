import '../entities/product_entity.dart';
import '../repositories/products_repository.dart';
import 'get_products_usecase.dart';

class GetProductsUsecaseImpl implements GetProductsUsecase {
  final ProductsRepository repository;
  GetProductsUsecaseImpl({required this.repository});

  @override
  Future<List<ProductEntity>> call() async {
    return repository.getProducts();
  }
}
