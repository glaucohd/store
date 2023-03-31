import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/core/constants.dart';

import '../controllers/auth_controller.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return Column(
          children: [
            GoogleAuthButton(
              themeMode: ThemeMode.light,
              style: const AuthButtonStyle(
                width: 250,
                textStyle: TextStyle(fontSize: 16),
                borderRadius: 5,
                padding: EdgeInsets.all(13),
              ),
              onPressed: () async {
                final result = await controller.signInWithGoogle();
                if (result == true) {
                  controller.navigateTo(route: "/products");
                }
              },
              text: Constants.signInWithGoogle,
            ),
            const SizedBox(height: 16),
            FacebookAuthButton(
              themeMode: ThemeMode.light,
              style: const AuthButtonStyle(
                width: 250,
                textStyle: TextStyle(fontSize: 16),
                borderRadius: 5,
                padding: EdgeInsets.all(13),
              ),
              onPressed: () async {
                final result = await controller.signInWithFacebook();
                if (result == true) {
                  controller.navigateTo(route: "/products");
                }
              },
              text: Constants.signInWithFacebook,
            ),
          ],
        );
      },
    );
  }
}
