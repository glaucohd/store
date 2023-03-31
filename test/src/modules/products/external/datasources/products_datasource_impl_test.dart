import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store/src/modules/products/external/datasources/products_datasource_impl.dart';

import 'products_datasource_impl_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final datasource = ProductsnDatasourceImpl(client: client);
  test('deve retornar um resultado positivo da chamada da API', () async {
    when(client.get(
            Uri.parse('https://64150eade8fe5a3f3a146700.mockapi.io/Products')))
        .thenAnswer((_) => Future.value(http.Response(body, 200)));

    final future = datasource.getProducts();
    expect(future, completes);
  });
}

const body = '''[
{
"product": "Intelligent Frozen Bacon",
"description": "New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016",
"thumbnail": "https://loremflickr.com/640/480/food",
"id": "1"
},
{
"product": "Fantastic Wooden Mouse",
"description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
"thumbnail": "https://loremflickr.com/640/480/food",
"id": "2"
},
{
"product": "Unbranded Soft Table",
"description": "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
"thumbnail": "https://loremflickr.com/640/480/food",
"id": "3"
}
]''';
