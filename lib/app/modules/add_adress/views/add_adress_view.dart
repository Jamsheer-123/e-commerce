import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/add_adress/controllers/add_adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local.widget/index.dart';

class AddAdressView extends GetView<AddAdressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 230, 224),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 15, 114),
          title: Text("Add New Address"),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFeeld(
                    hintText: "Full Name",
                    controls: controller.nameController,
                    validator: Validators.noneEmptyValidator,
                    keybord: TextInputType.name,
                  ),
                  TextFeeld(
                      hintText: "Phone Number",
                      controls: controller.phoneController,
                      validator: Validators.noneEmptyValidator,
                      keybord: TextInputType.phone),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: TextFeeld(
                            hintText: "Pin Code",
                            controls: controller.pinCodeController,
                            validator: Validators.pincodeValidator,
                            keybord: TextInputType.number),
                      ),
                      Container(
                        width: 200,
                        child: TextFeeld(
                          hintText: "City",
                          controls: controller.cityController,
                          keybord: TextInputType.text,
                          validator: Validators.noneEmptyValidator,
                        ),
                      ),
                    ],
                  ),
                  TextFeeld(
                    hintText: "House No,Buliding Name",
                    controls: controller.str1Controller,
                    keybord: TextInputType.streetAddress,
                    validator: Validators.noneEmptyValidator,
                  ),
                  TextFeeld(
                    keybord: TextInputType.streetAddress,
                    hintText: "Road name,Building Name",
                    controls: controller.str2Controller,
                    validator: Validators.noneEmptyValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RadioButtonWiddget(),
                  ),
                  SaveButton()
                ],
              )),
        ));
  }
}
