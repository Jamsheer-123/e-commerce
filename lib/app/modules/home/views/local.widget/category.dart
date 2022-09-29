import 'package:e_cart_shopping/app/modules/home/controllers/home_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Category extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: IconBox(icon: 'assets/svg/kids.svg', text: "Kids"),
            onTap: () {
              Get.toNamed(Routes.SHOW_PRODUCT, arguments: "kids");
            },
          ),
          GestureDetector(
            child: IconBox(icon: 'assets/svg/footware.svg', text: "FootWear"),
            onTap: () {
              Get.toNamed(Routes.SHOW_PRODUCT, arguments: "footwear");
            },
          ),
          GestureDetector(
            child: IconBox(icon: 'assets/svg/cloth.svg', text: "Cloth"),
            onTap: () {
              Get.toNamed(Routes.SHOW_PRODUCT, arguments: "cloth");
            },
          ),
          GestureDetector(
            child: IconBox(icon: 'assets/svg/gadget.svg', text: "Gadget"),
            onTap: () {
              Get.toNamed(Routes.SHOW_PRODUCT, arguments: "gadget");
            },
          ),
          GestureDetector(
            child: IconBox(icon: 'assets/svg/gift.svg', text: "Gift"),
            onTap: () {
              Get.toNamed(Routes.SHOW_PRODUCT, arguments: "gift");
            },
          ),
        ],
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  IconBox({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ,
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all((15)),
              height: 65,
              width: (65),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Icon(icon)
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text)
          ],
        ),
      ),
    );
  }
}
