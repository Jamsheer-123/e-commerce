import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends GetView<LoginController> {
  LoginButton({Key? key, required this.onss}) : super(key: key);
  void Function() onss;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15, left: 30, right: 30),
      child: Obx(
        () => controller.isLoading.value
            ? Center(
                child: const CircularProgressIndicator(
                  color: AppColors.black,
                ),
              )
            : TextButton(
                onPressed: controller.isLoading.value ? null : onss,
                style: AppConstants.buttonStyle,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                  child: Text(
                    'Submit',
                    style: AppTextStyles.regular.copyWith(
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                )),
      ),
    );
  }
}
