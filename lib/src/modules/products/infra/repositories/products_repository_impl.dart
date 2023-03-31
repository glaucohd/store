import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_datasource.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsnDatasource datasource;
  ProductsRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<List<ProductEntity>> getProducts() {
    return datasource.getProducts();
  }
}
