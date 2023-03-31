import 'package:flutter/material.dart';
import 'package:store/src/modules/products/presentation/pages/base_page.dart';
import 'package:store/src/modules/products/presentation/pages/empty_page.dart';
import 'core/navigator_service.dart';
import 'core/routes.dart';
import 'modules/auth/presentation/pages/auth_page.dart';
import 'modules/products/presentation/pages/checkout_page.dart';
import 'modules/products/presentation/pages/products_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      navigatorKey: NavigatorService.instance.key,
      home: const AuthPage(),
      routes: {
        Routes.basePage: (context) => const BasePage(),
        Routes.productsPage: (context) => const ProductsPage(),
        Routes.checkoutPage: (context) => const CheckoutPage(),
        Routes.emptyPage: (context) => const EmpptyPage(),
      },
    );
  }
}
