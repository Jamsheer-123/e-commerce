import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/home/views/local.widget/exclusive_offer.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(bottom: 0),
        // margin: const EdgeInsets.only(),
        width: 165,
        child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DETAILED_PAGE, arguments: data['id']);
            },
            child: Card(
              elevation: 1,
              shadowColor: AppColors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 170,
                  height: 135,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(data['imageUrl']))),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: RatingStatWidget(rating: 3)),
                      Text(
                        data['productName'],
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 5, 14, 96),
                        ),
                      ),
                      verticalSpace(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "₹ ${data['price']}",
                            style: const TextStyle(color: Color(0xFFFF7643)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
