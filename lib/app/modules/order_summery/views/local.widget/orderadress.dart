// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/adress/address.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/adress/controllers/adress_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderAdressWidget extends GetView<AdressController> {
  OrderAdressWidget({
    Key? key,
  }) : super(key: key);
  @override
  AdressController controller = Get.put(AdressController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("address")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
                child: Container(
                    child: SingleChildScrollView(
              child: Column(
                children: [
                  // Image.asset("assets/images/emptycart.jpg"),
                  Text('Please add your Contact'),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_ADRESS);
                        },
                        child: Text(" Add Address")),
                  )
                ],
              ),
            )));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Address model = Address.getModelFromJson(
                      json: snapshot.data!.docs[index].data());
                  return Obx(() => controller.valuss == index
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AddModelwidget(model: model),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: OutlinedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.ADRESS);
                                  },
                                  child: Text("Change")),
                            )
                          ],
                        )
                      : Container());
                });
          }
        });
  }
}
