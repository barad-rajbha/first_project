import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserData extends ChangeNotifier {
  File? imageFile;
  String? imageUrl;
  TextEditingController number = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  String orderadd = '📍 dr.yagnik road rajkot, 360001';
  String companyname='Puma';
  String detail='Puma shoes 8';
  String time='03-jan-2022';
  bool orderAccept = false;

  dynamic galleryimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    imageFile = File(path);
    uploadImage();
    notifyListeners();
  }

  dynamic cameraimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.camera);
    String path = res!.path;
    imageFile = File(path);
    uploadImage();
    notifyListeners();
  }

  uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    String path = DateTime.now().millisecond.toString();

    Reference ref = storage.ref().child('image').child('$path.jpg');

    TaskSnapshot uploadTask = await ref.putFile(imageFile!);

    imageUrl = await uploadTask.ref.getDownloadURL();

    print(imageUrl);
  }

  orderAccepted() {
    orderAccept = true;
    notifyListeners();
  }
}
