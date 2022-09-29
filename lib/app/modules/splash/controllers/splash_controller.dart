import 'package:e_cart_shopping/app/modules/home/controllers/home_controller.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:e_cart_shopping/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  HomeController controller = Get.put(HomeController());
  @override
  void onInit() {
    start();
    super.onInit();
  }

  void start() async {
    await Future.delayed(Duration(seconds: 3));
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == false || userLoggedIn == null) {
      Get.offNamed(Routes.LOGIN);
    } else {
      Get.offNamed(Routes.DASH);
    }
  }
}
