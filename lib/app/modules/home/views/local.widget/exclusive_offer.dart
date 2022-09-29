import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/product/product.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/home/controllers/home_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularPRoduct extends GetView<HomeController> {
  PopularPRoduct({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Product",
                  style: AppTextStyles.normal,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SHOW_PRODUCT, arguments: "gadget");
                    },
                    child: Text("See More", style: AppTextStyles.regular))
              ],
            ),
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("product").snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              //
              if (snapshot.data!.docs.isEmpty) {
                Center(child: Text('NO DATA'));

                return Center(
                    child: Container(
                        child: Column(
                  children: [
                    Text('No Items'),
                  ],
                )));
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Products model = Products.getModelFromJson(
                            json: snapshot.data!.docs[index].data());

                        return Container(
                          margin: EdgeInsets.only(left: 0),
                          width: 165,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAILED_PAGE,
                                  arguments: model.id);
                            },
                            child: Card(
                              elevation: 1,
                              shadowColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                // side: BorderSide(
                                //     width: 1,
                                //     color: AppColors.black.withOpacity(0.3)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    width: 170,
                                    height: 135,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image:
                                                NetworkImage(model.imageUrl))),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 1),
                                            child: RatingStatWidget(rating: 3)),
                                        Text(
                                          model.productName,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 5, 14, 96),
                                          ),
                                        ),
                                        verticalSpace(6),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "₹ " '${model.price.toString()}',
                                              style: TextStyle(
                                                  color: Color(0xFFFF7643)),
                                            ),
                                            // RatingStatWidget(rating: 3),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class RatingStatWidget extends StatelessWidget {
  final double rating;
  const RatingStatWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < 5; i++) {
      children.add(i < rating
          ? const Icon(
              Icons.star,
              size: 15,
              color: Colors.orange,
            )
          : const Icon(Icons.star_border, size: 15, color: Colors.orange));
    }

    return Row(
      children: children,
    );
  }
}
