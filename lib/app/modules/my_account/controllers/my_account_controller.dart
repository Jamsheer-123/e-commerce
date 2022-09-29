import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  XFile? pickedFile;
  String url = "";
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;
  var imgName = "".obs;
  String? selectedImageName = "";

  ImagePicker imagePicker = ImagePicker();
  var isSelected = false.obs;

  uploadImage() async {
    final postImageRef = FirebaseStorage.instance.ref().child("ProductImages");
    var timekey = DateTime.now();

    UploadTask uploadTask =
        postImageRef.child("$timekey.jpg").putFile(File(pickedFile!.path));
    var dowurlll = await (await uploadTask).ref.getDownloadURL();
    url = dowurlll.toString();
  }

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = pickedImage;
    selectedImageName = pickedImage?.name.toString();
    imgName.value = selectedImageName!;
    isSelected.value = true;
  }

  @override
  void onClose() {}
}
