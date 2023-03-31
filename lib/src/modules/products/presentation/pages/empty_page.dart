import 'package:flutter/material.dart';

import 'package:store/src/modules/products/presentation/widgets/menu_drawer_widget.dart';

class EmpptyPage extends StatelessWidget {
  const EmpptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MenuDrawerWidget(),
      body: const Center(
        child: Text('Em contrução'),
      ),
    );
  }
}
