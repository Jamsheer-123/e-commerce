import 'package:e_cart_shopping/app/modules/add_adress/controllers/add_adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButton extends GetView<AddAdressController> {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: ElevatedButton(
          onPressed: () async {
            controller.saveAdress();
            // String output =
            //     await controller.addTOAddress(address: address);
            // if (output == "success") {
            //   Navigator.pushReplacement(context,
            //       MaterialPageRoute(builder: (_) => AdreesPage()));
            // } else {
            //   //error
            //   Utils().showSnackBar(context: context, content: output);
            // }
          },
          child: Text("Save Address"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.red))))),
    );
  }
}
