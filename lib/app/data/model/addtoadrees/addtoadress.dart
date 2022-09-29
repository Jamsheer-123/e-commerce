import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/adress/address.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToAddress {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future addressToDatabase({required Address address}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("address")
        .doc(address.id)
        .set(address.tojson());
  }
}
