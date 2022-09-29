import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_summery_controller.dart';
import 'local.widget/index.dart';

// ignore: must_be_immutable
class OrderSummeryView extends GetView<OrderSummeryController> {
  CollectionReference address =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Summery'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 13,
              ),
              child: Text(
                "Delevery to:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            OrderAdressWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 12),
              child: Text(
                "Items :",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            OrderItemsWidget(),
            PricingDetails(controller: controller),
          ],
        )),
        bottomNavigationBar: PaymentButton(controller: controller));
  }
}
