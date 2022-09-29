import 'package:get/get.dart';

import '../controllers/order_summery_controller.dart';

class OrderSummeryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSummeryController>(
      () => OrderSummeryController(),
    );
  }
}
