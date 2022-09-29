// class ProductModel {
//   ProductModel(
//       {required this.id,
//       required imageUrl,
//       required productName,
//       required price});
//   late final String id;
//   late final String imageUrl;
//   late final String productName;
//   late final String price;

//   Map<String, dynamic> getJson() {
//     return {
//       'id': id,
//       'imageUrl': imageUrl,
//       'productName': productName,
//       'price': price,
//     };
//   }

//   factory ProductModel.fromJson(dynamic json) {
//     return ProductModel(
//         id: json['id'],
//         imageUrl: json["imageUrls"],
//         productName: json["productName"],
//         price: json["price"]);
//   }
// }
// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.description,
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.price,
    this.qty,
  });

  final String id;
  final String productName;
  final String imageUrl;
  final int price;
  final String? description;
  final int? qty;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      id: json["id"],
      productName: json["productName"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      description: json["description"],
      qty: json["qty"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "imageUrl": imageUrl,
        "price": price,
        "description": description,
        "qty": qty,
      };
  factory Products.getModelFromJson({required Map<String, dynamic> json}) {
    return Products(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        qty: json["qty"]);
  }
}
