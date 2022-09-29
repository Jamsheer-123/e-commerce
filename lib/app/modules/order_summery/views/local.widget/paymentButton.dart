import 'package:e_cart_shopping/app/infastructure/utils/custombutoon.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/order_summery/controllers/order_summery_controller.dart';
import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderSummeryController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
      ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total Amount"),
                verticalSpace(5),
                Text(
                  "₹ " '${controller.argumentData[0]}',
                  // controller.totalPrice.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 219, 11, 126),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: (190),
              child: CustomButton(
                  text: "Place order",
                  press: () {
                    ///Make payment
                    var options = {
                      'key': "rzp_test_jcFF9EpMHxDsTD",
                      // amount will be multiple of 100
                      'amount':
                          (int.parse('${controller.argumentData[0]}') * 100)
                              .toString(), //So its pay 500
                      'name': controller.model.name,
                      'description': 'payment',
                      'timeout': 300, // in seconds
                      'prefill': {
                        'contact': controller.model.email,
                        'email': controller.model.email,
                      }
                    };
                    controller.razorpay.open(options);
                  }
                  // Get.toNamed(Routes.PAYMENT);
                  // await _firestore
                  //     .collection('users')
                  //     .doc(_auth.currentUser!.uid)
                  //     .collection('cart')
                  //     .get()
                  //     .then((value) async {
                  //   productIds =
                  //       value.docs.map((e) => e.data()['id']).toList();
                  // });
                  // Get.toNamed(Routes.ORDER_SUMMERY, arguments: productIds);

                  ),
            ),
          ],
        ),
      ),
    );
  }
}
