import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AdressController extends GetxController {
  var valuss = 0.obs;
  final count = 0.obs;

  deleteAddress(String id) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("address")
        .doc(id)
        .delete();
  }
}
