import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detailed_page_controller.dart';
import 'local.widget/index.dart';

// ignore: must_be_immutable
class DetailedPageView extends GetView<DetailedPageController> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('product');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(controller.argumentData).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.green,
          ));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Container(child: Text("Document does not exist"));
        }
        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            // backgroundColor: Color(0xFFF5F6F9),
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              child: CustomAppBar(),
              preferredSize: Size.fromHeight(70),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImagess(data: data),
                  RoundedContainer(data: data),
                  ColorDots(data: data),
                  DefaultButton(data: data),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.blue5,
          ),
        );
      },
    );
  }
}












/////////////////////////////
///
