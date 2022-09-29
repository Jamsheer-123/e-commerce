// import 'index.dart';

// class UserManager {
//   static var userId = '';
//   static var isUserLoged = false;
//   static Future<void> intUser() async {
//     userId = await SharedPreferenceManager.instance.getValueFor("userId");
//     isUserLoged =
//         await SharedPreferenceManager.instance.getBoolValueFor("isUserLoged");
//   }

//   static Future<void> saveUserId(String id) async {
//     SharedPreferenceManager.instance.setValue("userId", id);
//   }

//   static Future<void> setUserLoginStatus(bool status) async {
//     SharedPreferenceManager.instance.setBoolValue("isUserLoged", status);
//   }

//   static Future<void> logOutUser() async {
//     SharedPreferenceManager.instance.clearDefaults();
//   }
// }
