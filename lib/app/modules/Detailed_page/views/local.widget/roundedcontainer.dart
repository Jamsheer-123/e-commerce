import 'package:e_cart_shopping/app/infastructure/utils/textStayles.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/detailed_page_controller.dart';

// ignore: must_be_immutable
class RoundedContainer extends GetView<DetailedPageController> {
  RoundedContainer({required this.data});

  final Map<String, dynamic> data;
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text('${data['productName']}', style: AppTextStyles.normal),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all((20)),
              width: (164),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Text("₹ " "${data['price']}",
                  style:
                      AppTextStyles.normal.copyWith(color: Color(0xFFFF4848))),
            ),
            GestureDetector(
              onTap: (() {
                isFavourite = false;
              }),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all((15)),
                  width: (64),
                  decoration: BoxDecoration(
                    color: isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/gift.svg",
                    color: isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                    height: (16),
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => controller.seemore.isFalse
              ? Padding(
                  padding: EdgeInsets.only(
                    left: (20),
                    right: (64),
                  ),
                  child: Text(
                    '${data['description']}',
                    maxLines: 3,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    left: (20),
                    right: (64),
                  ),
                  child: Text(
                    '${data['description']}',
                    maxLines: 7,
                  ),
                ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (20),
              vertical: 10,
            ),
            child: Row(
              children: [
                Obx(() => controller.seemore.isFalse
                    ? GestureDetector(
                        onTap: (() {
                          controller.seemore.value = true;
                        }),
                        child: Text(
                          " See More Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF7643)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.seemore.value = false;
                        },
                        child: Text(
                          "  See Less Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF7643)),
                        ),
                      )),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFFFF7643),
                ),
              ],
            ))
      ]),
    );
  }
}
