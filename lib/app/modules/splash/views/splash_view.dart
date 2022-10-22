import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
            height: 150,
            child: SvgPicture.asset(
              "assets/svgicon/order.svg",
              color: Color(0xFFFF7643),
              fit: BoxFit.contain,
              width: 152,
            )),
      ),
    );
  }
}
