import 'package:e_cart_shopping/app/modules/login/views/local.widget/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageView(),
            LoginText(),
            CustomTextField(
                controller: controller,
                hintText: "Email",
                icon: Icons.email,
                keybord: TextInputType.emailAddress,
                controls: controller.email),
            CustomTextField(
                controller: controller,
                hintText: "Password",
                icon: Icons.key,
                keybord: TextInputType.visiblePassword,
                controls: controller.password),
            LoginButton(onss: controller.onSubmit),
            Center(child: CreateAccountText())
          ],
        ),
      )),
    );
  }
}
