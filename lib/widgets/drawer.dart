import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {

  @override
  Widget build(BuildContext context) {
    UserData data = Provider.of<UserData>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.of(context).pushReplacementNamed('/');
                      data.name.clear();
                      data.number.clear();
                      data.email.clear();
                      data.address.clear();
                      data.city.clear();
                      data.pincode.clear();
                      data.state.clear();
                      data.imageFile == null;
                    } );
              },
              child: Card(
                elevation: 5,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF672635),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
