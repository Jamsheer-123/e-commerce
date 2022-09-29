import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/data/model/user/user_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_type/result_type.dart';

class FireBaseAuthHelper {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<Result> sinUp(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return Failure('');
    } finally {
      if (firebaseAuth.currentUser != null) {
        return Success('');
      } else {
        return Failure('');
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future<Result> SinIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return Failure('');
    } finally {
      if (firebaseAuth.currentUser != null) {
        // ignore: control_flow_in_finally
        return Success('');
      } else {
        // ignore: control_flow_in_finally
        return Failure('');
      }
    }
  }

  Future saveUserDetails({required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }
}
