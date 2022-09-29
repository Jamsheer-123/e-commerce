import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void logout() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    firebaseAuth.signOut();
    Get.offNamed(Routes.SPLASH);
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onClose() {}
}
