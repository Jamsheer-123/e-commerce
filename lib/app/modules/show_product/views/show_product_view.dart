import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/modules/home/views/local.widget/home_header.dart';
import 'package:e_cart_shopping/app/modules/search/views/local.widget/product_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_product_controller.dart';

class ShowProductView extends GetView<ShowProductController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: HomeHeader(size: size),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('product')
                .where("category", isEqualTo: controller.type)
                .snapshots(),
            builder: (context, snapshots) {
              if (!snapshots.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshots.data!.docs.isEmpty) {
                return Center(child: Text("no items"));
              } else {
                GridView.builder(
                    semanticChildCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250, crossAxisCount: 2),
                    shrinkWrap: true,
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      return ProductTile(data: data);
                    });
              }
              return GridView.builder(
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250, crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    return ProductTile(data: data);
                  });
            },
          )),
    );
  }
}
