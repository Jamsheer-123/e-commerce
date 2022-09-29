import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/home/controllers/home_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeHeader extends GetView<HomeController> {
  HomeHeader({required this.size});
  final Size size;
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width * 0.65,
              child: CupertinoSearchTextField(onTap: () {
                Get.toNamed(Routes.SEARCH, arguments: searchcontroller);
                FocusScope.of(context).requestFocus(FocusNode());
              })),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey1.withOpacity(0.4),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.red,
                        child: Text("1"),
                        radius: 10,
                      ),
                      IconButton(
                          alignment: Alignment.center,
                          onPressed: () {
                            Get.toNamed(Routes.CART);
                          },
                          icon: Icon(Icons.shopping_cart,
                              color: Color.fromARGB(255, 52, 46, 46))),
                    ],
                  ),
                ),
                horizontalSpace(5),
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey1.withOpacity(0.4),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.red,
                        child: Text("1"),
                        radius: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                          )),
                    ],
                  ),
                  // color: AppColors.grey1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
