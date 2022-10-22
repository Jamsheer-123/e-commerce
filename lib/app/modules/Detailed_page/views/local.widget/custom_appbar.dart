import 'package:e_cart_shopping/app/data/firebase/addtocart/add-to_cart.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/Detailed_page/controllers/detailed_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<DetailedPageController> {
  CustomAppBar({
    required this.data,
    Key? key,
  }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFF5F6F9),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "4.5",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpace(5),
                        Image.asset("assets/images/star.png"),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  GestureDetector(
                      onTap: () {
                        if (controller.isSelected.value == false) {
                          controller.isSelected.value = true;
                          controller.addToWishlist(
                              productModel: Cart(
                                  id: '${data['id']}',
                                  productName: '${data['productName']}',
                                  imageUrl: '${data['imageUrl']}',
                                  price: controller.models.price,
                                  qty: controller.items.toInt()));
                          controller.changeToWishlist(
                              wishlist: Wishlist(
                                  wishlist: controller.isSelected.value,
                                  id: '${data['id']}'));
                          Utils().showSnackBar(
                              context: context, content: "Added to Wishlist.");
                        } else {
                          controller.isSelected.value = false;
                          controller.deleteItems('${data['id']}');
                          Utils().showSnackBar(
                              context: context,
                              content: "Item Remove to Wishlist.");
                          controller.changeToWishlist(
                              wishlist: Wishlist(
                                  wishlist: controller.isSelected.value,
                                  id: '${data['id']}'));
                        }
                      },
                      child: Obx(
                        () => Icon(
                          Icons.favorite,
                          size: 30,
                          color: controller.isSelected.value
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
