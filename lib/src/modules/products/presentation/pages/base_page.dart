import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/modules/products/presentation/pages/logout_page.dart';

import 'package:store/src/modules/products/presentation/pages/products_page.dart';

import '../controllers/products_controller.dart';
import 'empty_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<ProductsController>(builder: (context, controller, child) {
      return PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ProductsPage(),
          EmpptyPage(),
          EmpptyPage(),
          EmpptyPage(),
          LogoutPage()
        ],
      );
    }));
  }
}
