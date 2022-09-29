import 'package:e_cart_shopping/app/data/firebase/auth/firbase_auth.dart';
import 'package:e_cart_shopping/app/infastructure/utils/colors.constants.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:e_cart_shopping/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  final FireBaseAuthHelper fireBaseAuthHelper = FireBaseAuthHelper();

  void onSubmit() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      var result = await fireBaseAuthHelper.SinIn(
          email.text.trim(), password.text.trim());
      if (result.isSuccess) {
        final SharedPreferences sharedPrefs =
            await SharedPreferences.getInstance();
        sharedPrefs.setBool(SAVE_KEY_NAME, true);

        Get.offAllNamed(
          Routes.DASH,
        );
        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
            "Invalid Password Or email", "Please enter currect password",
            backgroundColor: AppColors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(5));
      }
    }
  }
}
