import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/cart/views/local.widget/item_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderItemsWidget extends StatelessWidget {
  const OrderItemsWidget({
    Key? key,
  }) : super(key: key);

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
          return Container(
            child: Center(
                child: Container(
                    child: Column(
              children: [
                Image.asset("assets/images/emptycart.jpg"),
                Text('Your Cart is empty'),
              ],
            ))),
          );
        } else {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Cart model = Cart.getModelFromJson(
                    json: snapshot.data!.docs[index].data());
                return Container(
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
                );
              });
        }
      },
    );
  }
}
