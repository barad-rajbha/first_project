import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserData extends ChangeNotifier {
  File? picImage;
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
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  dynamic galleryimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    picImage = File(path);
    notifyListeners();
  }

  dynamic cameraimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.camera);
    String path = res!.path;
    picImage = File(path);
    notifyListeners();
  }
}
