// ignore_for_file: must_be_immutable

import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/add_adress/controllers/add_adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFeeld extends GetView<AddAdressController> {
  final String hintText;
  final TextInputType keybord;
  String? Function(String?)? validator;
  final TextEditingController controls;
  // final TextInputType type;
  final bool visbilty;
  TextFeeld(
      {Key? key,
      required this.hintText,
      required this.controls,
      required this.keybord,
      // required this.type,
      this.visbilty = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
      child: TextFormField(
        validator: validator,
        controller: controls,
        obscureText: visbilty,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keybord,
        decoration: AppInputDeceration.defalt.copyWith(
          hintText: hintText,
          // labelText: 'Mobile Number',
        ),
      ),
    );
  }
}
