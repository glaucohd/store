import '../models/product_model.dart';

abstract class ProductsnDatasource {
  Future<List<ProductModel>> getProducts();
}
