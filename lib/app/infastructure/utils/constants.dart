import 'package:flutter/material.dart';

import 'index.dart';

class AppConstants {
  static const double padding = 20.0;
  static var buttonStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(400, 50)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: const BorderSide(color: Colors.transparent),
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.blue1),
  );
}
