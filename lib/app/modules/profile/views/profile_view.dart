import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'local.widget/profile_items.dart';
import 'local.widget/profile_pic.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  @override
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(child: ProfilePic()),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/svgicon/user.svg",
                  press: () => {Get.toNamed(Routes.MY_ACCOUNT)},
                ),
                ProfileMenu(
                  text: "Notification",
                  icon: "assets/svgicon/notification.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/svgicon/settings.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/svgicon/helpcenter.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "My Order",
                  icon: "assets/svgicon/order.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Logout",
                  icon: "assets/svgicon/logout.svg",
                  press: () => {controller.logout()},
                ),
              ])),
    );
  }
}
