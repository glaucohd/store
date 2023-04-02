import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../auth/presentation/pages/auth_page.dart';
import '../../../auth/presentation/widgets/button_widget.dart';
import '../controllers/products_controller.dart';
import '../widgets/maps_widget.dart';
import '../widgets/resume_product_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(controller.productSelected?.product ?? '-'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ListView(
              children: [
                Column(
                  children: const [
                    MapsWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: DividerWidget(description: "Descrição"),
                    ),
                    ResumeProductWidget(),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            child: ButtonWidget(
              text: Constants.makePurchase,
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  isDismissible: false,
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  Constants.doYouWantToMakeThePurchase,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: ButtonWidget(
                                    onTap: () async {
                                      controller.popToPage();
                                      await Future.delayed(
                                        const Duration(milliseconds: 200),
                                        () {
                                          final snackBar = SnackBar(
                                            duration:
                                                const Duration(seconds: 1),
                                            content: Text(Constants
                                                .purchaseMadeSuccessfully),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);

                                          Timer(
                                            const Duration(milliseconds: 500),
                                            () {
                                              controller.popToPage();
                                            },
                                          );
                                        },
                                      );
                                    },
                                    text: Constants.purchase,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  enableDrag: false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
