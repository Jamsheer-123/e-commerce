import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/modules/profile/controllers/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfilePic extends GetView<ProfileController> {
  ProfilePic({
    Key? key,
  }) : super(key: key);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 125,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          FutureBuilder(
              future: users.doc(firebaseAuth.currentUser?.uid).get(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return CircleAvatar(
                    backgroundImage: AssetImage("assets/images/users.png"),
                  );
                }
                if (snapshot.hasData && !snapshot.data!.exists) {
                  return CircleAvatar(
                    backgroundImage: AssetImage("assets/images/users.png"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Obx(() => controller.img.isEmpty
                      ? CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/users.png"),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage('${data["imageurl"]}'),
                        ));
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
