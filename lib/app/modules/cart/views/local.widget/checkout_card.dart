import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/infastructure/utils/colors.constants.dart';
import 'package:e_cart_shopping/app/infastructure/utils/custombutoon.dart';
import 'package:e_cart_shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckoutCard extends GetView<CartController> {
  CheckoutCard({
    Key? key,
  }) : super(key: key);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List productIds = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: (40),
                  width: (40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/svg/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.grey2,
                )
              ],
            ),
            SizedBox(height: (20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      "₹  " '${controller.totalPrice.toString()}',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 219, 11, 126),
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: (190),
                  child: CustomButton(
                    text: "Check Out",
                    press: () async {
                      await _firestore
                          .collection('users')
                          .doc(_auth.currentUser!.uid)
                          .collection('cart')
                          .get()
                          .then((value) async {
                        productIds =
                            value.docs.map((e) => e.data()['id']).toList();
                      });
                      Get.toNamed(Routes.ORDER_SUMMERY, arguments: [
                        controller.totalPrice.toString(),
                        {'Second data'}
                      ]);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
