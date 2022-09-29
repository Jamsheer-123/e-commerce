import 'package:e_cart_shopping/app/modules/sinup/views/local.widget/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sinup_controller.dart';

class SinupView extends GetView<SinupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              ImageView(),
              CustomTextField(
                  controller: controller,
                  hintText: "User Name",
                  icon: Icons.person,
                  keybord: TextInputType.name,
                  controls: controller.userName),
              CustomTextField(
                  controller: controller,
                  hintText: "Email",
                  icon: Icons.email,
                  keybord: TextInputType.name,
                  controls: controller.email),
              CustomTextField(
                  controller: controller,
                  hintText: "Password",
                  icon: Icons.key,
                  keybord: TextInputType.name,
                  controls: controller.password),
              SubmitButton(),
              MoveToLogin()
            ],
          ),
        ),
      ),
    );
  }
}
