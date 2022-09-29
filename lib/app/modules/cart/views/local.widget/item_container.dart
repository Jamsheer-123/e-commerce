import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemContainer extends GetView<CartController> {
  const ItemContainer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Cart model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.only(left: 13, top: 38),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(
              model.productName,
              maxLines: 3,
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.w700),
            ),
          ),
          verticalSpace(9),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "₹ " '${model.price.toString()}',
                style: TextStyle(
                    color: AppColors.blue6, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: " X ",
                style: TextStyle(
                    color: Color.fromARGB(255, 188, 35, 35),
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: model.qty.toString(),
                style: TextStyle(
                    color: AppColors.green, fontWeight: FontWeight.w700),
              )
            ]),
          )
        ],
      ),
    );
  }
}
