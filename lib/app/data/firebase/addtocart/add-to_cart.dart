import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart';

class AddToCart {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future addProductToCart({required Cart productModel}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .doc(productModel.id)
        .set(productModel.toJson());
  }
}

class Cart {
  Cart({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.qty,
  });

  final String id;
  final String productName;
  final String imageUrl;
  final int price;

  final int qty;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
      id: json["id"],
      productName: json["productName"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      qty: json["qty"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "imageUrl": imageUrl,
        "price": price,
        "qty": qty,
      };
  factory Cart.getModelFromJson({required Map<String, dynamic> json}) {
    return Cart(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        qty: json["qty"]);
  }
}
