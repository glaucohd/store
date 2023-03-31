import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store/src/modules/products/domain/entities/product_entity.dart';
import 'package:store/src/modules/products/domain/repositories/products_repository.dart';
import 'package:store/src/modules/products/domain/usecases/get_products_usecase_impl.dart';
import 'get_products_usecase_impl_test.mocks.dart';

@GenerateMocks([ProductsRepository])
void main() {
  final repository = MockProductsRepository();
  final usecase = GetProductsUsecaseImpl(repository: repository);

  test('Deve um objeto do tipo List<ProductEntity>', () async {
    // Arrange
    List<ProductEntity> listProducts = <ProductEntity>[];

    when(repository.getProducts()).thenAnswer((_) async => listProducts);
    // Act
    final result = await usecase();

    // Assert
    expect(result, isInstanceOf<List<ProductEntity>>());
  });
}
