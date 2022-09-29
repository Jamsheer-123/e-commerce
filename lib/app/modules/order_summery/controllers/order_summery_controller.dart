import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/user/user_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OrderSummeryController extends GetxController {
  List<dynamic> argumentData = Get.arguments;

  var razorpay;
  @override
  void onInit() {
    fetchData();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  UserDetailsModel model = UserDetailsModel(
      name: "name", email: "emails", uId: "uId", imageurl: null);
  Future fetchData() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    model = UserDetailsModel.fromJson(snap.data() as dynamic);
    log(model.name);
  }

  @override
  void onClose() {}
}
