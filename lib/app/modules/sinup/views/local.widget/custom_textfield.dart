import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/sinup/controllers/sinup_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon,
      required this.keybord,
      required this.controls,
      this.validator})
      : super(key: key);
  final TextEditingController controls;

  final IconData icon;
  final TextInputType keybord;
  final SinupController controller;
  final String hintText;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 19, right: 19, bottom: 19),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: validator,
        controller: controls,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        keyboardType: keybord,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 17),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Icon(
              icon,
              color: AppColors.blue2,
            ),
            //  Text(
            //   " (+91) ",
            //   style: TextStyle(color: Colors.white, fontSize: 17),
            // ),
          ),
        ),
      ),
    );
  }
}
