import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/product/product.dart';
import 'package:get/get.dart';

class DetailedPageController extends GetxController {
  String argumentData = Get.arguments;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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
}
