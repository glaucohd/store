import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/products_controller.dart';

class ResumeProductWidget extends StatelessWidget {
  const ResumeProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsController>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.productSelected?.product ?? '-',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.productSelected?.description ?? '-',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.purple,
                height: 105,
                child: CachedNetworkImage(
                  imageUrl: controller.productSelected?.thumbnail ?? "-",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
