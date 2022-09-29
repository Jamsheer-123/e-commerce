import 'package:get/get.dart';

import '../controllers/add_adress_controller.dart';

class AddAdressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAdressController>(
      () => AddAdressController(),
    );
  }
}
