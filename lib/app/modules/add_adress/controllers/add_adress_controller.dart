import 'package:e_cart_shopping/app/data/model/addtoadrees/addtoadress.dart';
import 'package:e_cart_shopping/app/data/model/adress/address.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdressController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController str1Controller = TextEditingController();
  TextEditingController str2Controller = TextEditingController();
  AddToAddress addtoadress = AddToAddress();
  var formKey = GlobalKey<FormState>();
  var value = "home";
  var valuss = false.obs;

  saveAdress() {
    if (formKey.currentState!.validate()) {
      Address address = Address(
          id: DateTime.now().toString().trim(),
          fullName: nameController.text,
          phone: phoneController.text,
          pinCode: pinCodeController.text,
          city: cityController.text,
          strAddress1: str1Controller.text,
          strAddress2: str2Controller.text,
          type: value);
      addtoadress.addressToDatabase(address: address);
      Get.offAndToNamed(Routes.ADRESS);
    }
  }
}
