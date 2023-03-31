import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String? product,
    String? description,
    String? thumbnail,
    String? id,
  }) : super(
          description: description,
          id: id,
          product: product,
          thumbnail: thumbnail,
        );

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      product: json['product'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      id: json['id'],
    );
  }
}
