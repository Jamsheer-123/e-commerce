import 'package:get/get.dart';

import '../controllers/detailed_page_controller.dart';

class DetailedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailedPageController>(
      () => DetailedPageController(),
    );
  }
}
