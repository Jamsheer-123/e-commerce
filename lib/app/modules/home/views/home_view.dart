import 'package:e_cart_shopping/app/modules/home/views/local.widget/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'local.widget/ad_banner.dart';
import 'local.widget/category.dart';
import 'local.widget/exclusive_offer.dart';
import 'local.widget/home_header.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: HomeHeader(size: size),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // AdBanner(),
            Category(),
            BannerSlider(),
            PopularPRoduct(
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
