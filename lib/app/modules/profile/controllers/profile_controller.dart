import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/user/user_details_model.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final count = 0.obs;
  XFile? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  String? selectedImageName = "";
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;
  var img = "".obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void logout() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    firebaseAuth.signOut();
    Get.offNamed(Routes.SPLASH);
  }

  var isloading = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  UserDetailsModel model = UserDetailsModel(
      name: "name", email: "emails", uId: "uId", imageurl: null);
  Future fetchData() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .whenComplete(() {});

    model = UserDetailsModel.fromJson(snap.data() as dynamic);
    img.value = model.imageurl.toString();
  }
}
