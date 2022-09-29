import 'package:e_cart_shopping/app/data/firebase/auth/firbase_auth.dart';
import 'package:e_cart_shopping/app/data/model/user/user_details_model.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:e_cart_shopping/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinupController extends GetxController {
  final FireBaseAuthHelper fireBaseAuthHelper = FireBaseAuthHelper();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  void submit() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      var result = await fireBaseAuthHelper.sinUp(
          email.text.trim(), password.text.trim());

      if (result.isSuccess) {
        final myUserId = FirebaseAuth.instance.currentUser?.uid;
        UserDetailsModel user = UserDetailsModel(
            name: userName.text.toString(),
            email: email.text,
            uId: myUserId.toString(),
            imageurl: "");
        fireBaseAuthHelper.saveUserDetails(user: user);
        final SharedPreferences sharedPrefs =
            await SharedPreferences.getInstance();
        sharedPrefs.setBool(SAVE_KEY_NAME, true);
        Get.offAllNamed(
          Routes.DASH,
        );
      } else {
        Get.snackbar("Invalid email", " password must 6 character",
            backgroundColor: AppColors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(5));
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {}
}
