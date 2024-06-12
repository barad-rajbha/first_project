// import 'dart:js_interop';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class AuthHelper {
//   AuthHelper._();
//
//   static final AuthHelper authHelper = AuthHelper._();
//
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   verifyPhoneNumber(dynamic number) async {
//     await firebaseAuth.verifyPhoneNumber(
//         verificationCompleted: (PhoneAuthCredential credential) {},
//         verificationFailed: (FirebaseAuthException ex) {},
//         codeSent: (String verifycationid, int? resendtoken) {},
//         codeAutoRetrievalTimeout: (String verficationid) {},
//         phoneNumber: number.text.toString());
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';

class FireStoreData {
  FireStoreData._();

  static final FireStoreData fireStoreData = FireStoreData._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addData(BuildContext context) async {
    UserData data = Provider.of<UserData>(context);
    DateTime date = DateTime.now();
    String yearref = date.year.toString();
    String month = date.month.toString();
    String datetime =
        '${date.microsecond}-${date.second}-${date.day}-${date.month}-${date.year}';
    print(data.name.text.toString());
    print(data.number.text.toString());
    print(data.email.text.toString());
    print(data.address.text.toString());
    print(data.pincode.text.toString());
    print(data.city.text.toString());
    print(data.state.text.toString());

    await firestore
        .collection('AllUsersDelivery')
        .doc(data.number.text)
        .collection(yearref)
        .doc(month)
        .collection('orders')
        .doc(datetime)
        .set({
      'name': data.name,
      'number': data.number,
      'email': data.email,
      'address': data.address,
      'pin code': data.pincode,
      'city': data.city,
      'state': data.state.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('success'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pushReplacementNamed('home');
    });
  }
}
