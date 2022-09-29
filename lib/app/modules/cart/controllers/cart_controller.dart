import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var totalPrice = 0.obs;
  var totalItems = 0.obs;
  Future getCartItems() async {
    List productIds = [];
    List<Cart> productsDetails = [];
    totalPrice.value = 0;
    totalItems.value = 0;

    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .get()
          .then((value) async {
        productIds = value.docs.map((e) => e.data()['id']).toList();

        for (var item in productIds) {
          try {
            await _firestore
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("cart")
                .doc(item)
                .get()
                .then((value) {
              productsDetails.add(Cart.fromJson(value.data()!));
            });
          } catch (e) {
            print(e);
          }
        }

        for (var item in productsDetails) {
          var totalvalue = item.price * item.qty;
          totalItems = totalItems + item.qty;
          totalPrice = totalPrice + totalvalue;
        }
        return totalPrice;
      });
    } catch (e) {
      print(e);
    }
    return totalPrice;
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  deleteItems(String id) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart")
        .doc(id)
        .delete();

    getCartItems();
  }

  @override
  void onClose() {}
}
