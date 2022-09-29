import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        'Login Your Account ',
        textAlign: TextAlign.center,
        style: AppTextStyles.bold.copyWith(
          color: Color.fromARGB(255, 18, 170, 46),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
