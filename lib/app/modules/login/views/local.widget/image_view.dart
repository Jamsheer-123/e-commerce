import 'package:e_cart_shopping/app/infastructure/utils/app_images.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: size.height * 0.4,
          child: Image.asset(AppImages.sinupimage),
        ),
      ),
    );
  }
}
