// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/adress/address.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/adress_controller.dart';

// ignore: must_be_immutable
class AdressView extends GetView<AdressController> {
  @override
  AdressController controller = Get.put(AdressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 228, 227),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 228, 227),
        elevation: 0,
        title: Text(
          "My Addresses",
          style: AppTextStyles.normal.copyWith(color: AppColors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADD_ADRESS);
                },
                child: Row(
                  children: [
                    Text(
                      "Add",
                      style: TextStyle(color: AppColors.green),
                    ),
                    horizontalSpace(4),
                    Icon(
                      Icons.add,
                      color: AppColors.green,
                    ),
                  ],
                )),
          )
        ],
      ),
      body: StreamBuilder(
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
                    Text('Please add your Contact'),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed(Routes.ADD_ADRESS);
                          },
                          child: Text("Add Contact")),
                    )
                  ],
                ),
              )));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Address model = Address.getModelFromJson(
                        json: snapshot.data!.docs[index].data());
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      margin: EdgeInsets.only(
                          top: 20, bottom: 10, left: 10, right: 10),
                      width: double.infinity,
                      height: 170,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => GestureDetector(
                                onTap: () {
                                  controller.valuss.value = index;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor:
                                        AppColors.grey1.withOpacity(0.8),
                                    child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: controller.valuss ==
                                                index
                                            ? AppColors.green.withOpacity(0.8)
                                            : AppColors.white),
                                  ),
                                ),
                              )),
                          AddModelwidget(model: model),
                          PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text("delete"),
                                      onTap: () {
                                        controller.deleteAddress(model.id);
                                      },
                                    ),
                                    PopupMenuItem(child: Text("Edit")),
                                  ])
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
