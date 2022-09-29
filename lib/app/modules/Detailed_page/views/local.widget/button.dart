import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/infastructure/utils/custombutoon.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/Detailed_page/controllers/detailed_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultButton extends GetView<DetailedPageController> {
  DefaultButton({required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
        child: CustomButton(
          text: "Add to Card",
          press: () async {
            AddToCart().addProductToCart(
                productModel: Cart(
                    id: '${data['id']}',
                    productName: '${data['productName']}',
                    imageUrl: '${data['imageUrl']}',
                    price: controller.models.price,
                    qty: controller.items.toInt()));
            Utils().showSnackBar(context: context, content: "Added to cart.");
          },
        ),
      ),
    );
  }
}
