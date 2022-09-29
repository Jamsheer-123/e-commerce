import 'package:get/get.dart';

import '../controllers/show_product_controller.dart';

class ShowProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowProductController>(
      () => ShowProductController(),
    );
  }
}
