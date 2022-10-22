import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/data/model/product/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DetailedPageController extends GetxController {
  String argumentData = Get.arguments;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var isSelected = false.obs;
  var seemore = false.obs;
  @override
  void onInit() {
    fetchData();

    super.onInit();
  }

  Products models = Products(
    id: "kjank",
    productName: "fkk",
    imageUrl: "99",
    price: 34,
    description: "cxc",
  );
  Future fetchData() async {
    DocumentSnapshot snap =
        await firebaseFirestore.collection('product').doc(argumentData).get();

    models = Products.fromJson(snap.data() as dynamic);
  }

  @override
  void onClose() {}
  var items = 1.obs;
  void addItems() async {
    items = items + 1;
    update();
  }

  void removeItems() async {
    if (items > 1) {
      items = items - 1;
    }
    update();
  }

  Future addToWishlist({required Cart productModel}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("wishlist")
        .doc(productModel.id)
        .set(productModel.toJson());
  }

  Future changeToWishlist({required Wishlist wishlist}) async {
    await firebaseFirestore
        .collection("product")
        .doc(wishlist.id)
        .update(wishlist.toJson());
  }
//

  deleteItems(String id) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("wishlist")
        .doc(id)
        .delete();
  }
}
