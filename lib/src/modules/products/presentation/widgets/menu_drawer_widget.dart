import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../controllers/products_controller.dart';

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Consumer<AuthController>(builder: (context, controller, child) {
            return SizedBox(
              height: 180,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CachedNetworkImage(
                              imageUrl: controller.infoUser.avatar ?? "-",
                              placeholder: (context, url) => const SizedBox(
                                height: 45,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Constants.welcome,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.infoUser.name ?? '-',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          Consumer<ProductsController>(builder: (context, controller, child) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.list,
                  ),
                  title: const Text("Lista de produtos"),
                  onTap: () {
                    controller.jumpToPage(indexPage: 0);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: Text(Constants.profiile),
                  onTap: () {
                    controller.jumpToPage(indexPage: 1);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                  ),
                  title: Text(Constants.myProducts),
                  onTap: () {
                    controller.jumpToPage(indexPage: 2);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: Text(Constants.settings),
                  onTap: () {
                    controller.jumpToPage(indexPage: 3);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: Text(Constants.logout),
                  onTap: () async {
                    controller.jumpToPage(indexPage: 4);
                  },
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
