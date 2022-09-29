// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetss extends GetView<MyAccountController> {
  BottomSheetss({
    Key? key,
  }) : super(key: key);
  @override
  MyAccountController controller = Get.put(MyAccountController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        color: Color(0xff1E2746),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            "Choos Your profile Photo",
            style: AppTextStyles.regular
                .copyWith(color: AppColors.white, fontSize: 18),
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset("assets/images/gallary.png"),
              ),
              onTap: () {
                controller.takePhoto(ImageSource.gallery);
              },
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset("assets/images/camera.png"),
              ),
              onTap: () {
                controller.takePhoto(ImageSource.camera);
              },
            )
          ],
        )),
        Obx(
          () => controller.isSelected.isFalse
              ? Container()
              : Column(
                  children: [
                    Obx(
                      () => controller.imgName.isEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Icon(
                                Icons.image,
                                size: 70,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey1.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 250,
                              width: 250,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Image.file(
                                File(controller.pickedFile!.path),
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 22),
                      padding: EdgeInsets.only(left: 60, right: 60, top: 0),
                      height: 43,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Upload"),
                        style: AppConstants.buttonStyle,
                        onPressed: () async {
                          controller.uploadImage().whenComplete(() {
                            Map<String, dynamic> data = {
                              "imageurl": controller.url,
                            };
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update(data);
                          }).whenComplete(() {
                            Get.offAndToNamed(Routes.PROFILE);
                          });
                        },
                      ),
                    ),
                  ],
                ),
        )
      ]),
    );
  }
}
