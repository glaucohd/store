import 'dart:convert';

import 'package:http/http.dart';

import '../../infra/datasources/products_datasource.dart';
import '../../infra/models/product_model.dart';

class ProductsnDatasourceImpl implements ProductsnDatasource {
  final Client client;
  ProductsnDatasourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> result = <ProductModel>[];
    var uri = 'https://64150eade8fe5a3f3a146700.mockapi.io/Products';

    try {
      final response = await client.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        result = List<ProductModel>.from(
          jsonData.map((model) => ProductModel.fromJson(model)),
        );

        return result;
      }
    } catch (e) {
      rethrow;
    }

    return result;
  }
}
