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
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uireprika/controller/controller.dart';

class FireStoreData {
  FireStoreData._();

  static final FireStoreData fireStoreData = FireStoreData._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserData data = UserData();

  addData(
    String name,
    String number,
    String email,
    String address,
    String city,
    String state,
  ) async {
    if (name == '' &&
        email == '' &&
        name == '' &&
        email == '' &&
        name == '' &&
        email == '') {
      log('fill detail');
    } else {
      await firestore.collection('user').doc(number).set({
        'name': name,
        'number': number,
        'email': email,
        'address': address,
        'city': city,
        'state': state,
      });
    }
  }


}
