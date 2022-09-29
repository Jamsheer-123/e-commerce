import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/infastructure/utils/colors.constants.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'local.widget/checkout_card.dart';
import 'local.widget/item_container.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart")
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Scaffold(
            body: Center(
                child: Container(
                    child: Column(
              children: [
                Image.asset("assets/images/emptycart.jpg"),
                Text('Your Cart is empty'),
              ],
            ))),
          );
        } else {
          return Scaffold(
              backgroundColor: Color(0xFFF5F6F9),
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                leading: IconButton(
                  padding: EdgeInsets.only(left: 18),
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      "Your Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                    Obx(() => Text(
                          // '${snapshot.data!.docs.length}' "  Items",
                          '${controller.totalItems}'
                          "   items",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ],
                ),
              ),
              body: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Cart model = Cart.getModelFromJson(
                        json: snapshot.data!.docs[index].data());
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (c) {
                                controller.deleteItems(model.id);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: AppColors.white,
                              icon: Icons.delete,
                              label: "Delete",
                              spacing: 8,
                            )
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.DETAILED_PAGE,
                                arguments: model.id);
                          },
                          child: Container(
                            color: AppColors.grey1.withOpacity(0.5),
                            padding: EdgeInsets.only(left: 12),
                            width: double.infinity,
                            height: 140,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  padding: EdgeInsets.all(8),
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(model.imageUrl),
                                ),
                                ItemContainer(model: model),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              bottomNavigationBar: CheckoutCard());
        }
      },
    );
  }
}
