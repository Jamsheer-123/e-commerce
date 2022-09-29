import 'package:get/get.dart';

import '../controllers/adress_controller.dart';

class AdressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdressController>(
      () => AdressController(),
    );
  }
}
