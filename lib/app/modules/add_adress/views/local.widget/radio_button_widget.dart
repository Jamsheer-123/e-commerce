import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/add_adress/controllers/add_adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RadioButtonWiddget extends GetView<AddAdressController> {
  AddAdressController addAdressController = Get.put(AddAdressController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              controller.valuss.value = false;
              controller.value = "Home";
            },
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: controller.valuss.isFalse
                    ? AppColors.green.withOpacity(0.8)
                    : Color.fromARGB(255, 155, 186, 212),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("home"), verticalSpace(5), Icon(Icons.home)],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.valuss.value = true;
              controller.value = "Work";
            },
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: controller.valuss.isTrue
                    ? AppColors.green.withOpacity(0.8)
                    : Color.fromARGB(255, 155, 186, 212),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Work"),
                    horizontalSpace(5),
                    Icon(Icons.work)
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
