import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/order_summery/controllers/order_summery_controller.dart';
import 'package:flutter/material.dart';

class PricingDetails extends StatelessWidget {
  const PricingDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderSummeryController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14),
      width: double.infinity,
      height: 200,
      color: Color.fromARGB(255, 243, 216, 216).withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Price Details",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price"),
              Text("₹ " '${controller.argumentData[0]}')
            ],
          ),
          verticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("DIscount"), Text("₹ " "0")],
          ),
          verticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delievry Charge"),
              Text(
                "FREE Delivery",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(fontSize: 20),
              ),
              Text("₹ " '${controller.argumentData[0]}')
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
