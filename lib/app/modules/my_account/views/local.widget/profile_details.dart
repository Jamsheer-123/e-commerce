import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:flutter/material.dart';

class ProfileDetailes extends StatelessWidget {
  ProfileDetailes({
    Key? key,
    required this.text,
    required this.text2,
    this.press,
  }) : super(key: key);
  final String text;
  final String text2;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              verticalSpace(8),
              Expanded(
                  child: Text(
                text2,
                style: AppTextStyles.normal.copyWith(
                  color: Color(0xFFFF7643),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
