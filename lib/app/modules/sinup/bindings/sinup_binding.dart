import 'package:get/get.dart';

import '../controllers/sinup_controller.dart';

class SinupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SinupController>(
      () => SinupController(),
    );
  }
}
