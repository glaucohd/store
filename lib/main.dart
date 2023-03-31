import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/modules/auth/external/datasources/user_social_network_datasources_impl.dart';
import 'package:store/src/modules/auth/infra/repositories/user_social_network_repository_impl.dart';

import 'src/app.dart';
import 'src/modules/auth/domain/usecases/get_user_social_network_usecase_impl.dart';
import 'src/modules/auth/presentation/controllers/auth_controller.dart';
import 'src/modules/products/domain/usecases/get_products_usecase_impl.dart';
import 'src/modules/products/external/datasources/products_datasource_impl.dart';
import 'src/modules/products/infra/repositories/products_repository_impl.dart';
import 'src/modules/products/presentation/controllers/products_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(
            usecase: GetUserSocialNetworkUsecaseImpl(
              repository: UserSocialNetworkRepositoryImpl(
                datasources: UserSocialNetworkDatasourcesImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsController(
            getProductsUsecase: GetProductsUsecaseImpl(
              repository: ProductsRepositoryImpl(
                datasource: ProductsnDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
