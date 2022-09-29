import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoveToLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10, top: 5),
      child: GestureDetector(
        onTap: () => Get.offAllNamed(Routes.LOGIN),
        child: Text(
          'Already an account ? Sign in ',
          textAlign: TextAlign.center,
          style: AppTextStyles.bold.copyWith(
            color: AppColors.grey1,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
