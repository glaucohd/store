import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/core/constants.dart';
import 'package:store/src/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:store/src/modules/auth/presentation/widgets/button_widget.dart';
import 'package:store/src/modules/products/presentation/widgets/menu_drawer_widget.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MenuDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ButtonWidget(
              onTap: () {
                showMyDialog(context: context);
              },
              text: Constants.logout),
        ),
      ),
    );
  }

  Future<void> showMyDialog({required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Consumer<AuthController>(builder: (context, controller, child) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Você deseja realmente sair?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  controller.popToPage();
                },
              ),
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
