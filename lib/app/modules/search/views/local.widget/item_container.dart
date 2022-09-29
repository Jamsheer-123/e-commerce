import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_cart_shopping/app/modules/home/views/local.widget/exclusive_offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemContainer extends GetView<CartController> {
  const ItemContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.only(left: 13, top: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(
              data["productName"],
              maxLines: 3,
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 1),
              child: RatingStatWidget(rating: 3)),
          verticalSpace(9),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "₹ " '${data["price"].toString()}',
                style: TextStyle(
                    color: AppColors.blue6, fontWeight: FontWeight.w700),
              ),
            ]),
          )
          // Text(
          //   "₹ " '${model.price.toString()}' "X" '${model.qty.toString()}',
          // style:
          //     TextStyle(color: AppColors.blue6, fontWeight: FontWeight.w700),
          // )
        ],
      ),
    );
  }
}
