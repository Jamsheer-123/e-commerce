import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:e_cart_shopping/app/modules/order_summery/views/local.widget/orderadress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local.widget/index.dart';

// ignore: must_be_immutable
class MyAccountView extends GetView<MyAccountController> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text(
            'My Account',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            padding: EdgeInsets.only(left: 15),
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black87,
                ),
                onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfilePic(),
              FutureBuilder<DocumentSnapshot>(
                  future: users.doc(firebaseAuth.currentUser!.uid).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    //Error Handling conditions
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text("Document does not exist");
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(children: <Widget>[
                        Column(
                          children: [
                            ProfileDetailes(
                              text: "User Name",
                              text2: '${data['name']}'.toUpperCase(),
                            ),
                            ProfileDetailes(
                              text: "phone",
                              text2: '${data['phone']}'.toString(),
                            ),
                            ProfileDetailes(
                              text: "email",
                              text2: '${data['email']}',
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Text(
                                        "Address",
                                        style: AppTextStyles.normal.copyWith(
                                          color: Color(0xFFFF7643),
                                        ),
                                      ),
                                    ),
                                    OrderAdressWidget(),
                                  ],
                                ))
                          ],
                        )
                      ]);
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.green,
                    ));
                  })
            ],
          ),
        ));
  }
}
