import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';
import '../widgets/orders.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String yearref = date.year.toString();
    String month = date.month.toString();
    String datetime =
        '${date.millisecond}-${date.microsecond}-${date.second}-${date.day}-${date.month}';
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserData userData = Provider.of<UserData>(context);
    double displaywidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              if (userData.name == '' ||
                  userData.number == '' ||
                  userData.email == '' ||
                  userData.address == '' ||
                  userData.pincode == '' ||
                  userData.city == '' ||
                  userData.state == '') {
                print('**************************************');
              } else {
                await firestore
                    .collection('AllUsersDelivery')
                    .doc('+91${userData.number.text}')
                    .collection(yearref)
                    .doc(month)
                    .collection('orders')
                    .doc(datetime)
                    .set({
                  'name': userData.name.text.toString(),
                  'number': userData.number.text.toString(),
                  'email': userData.email.text.toString(),
                  'address': userData.address.text.toString(),
                  'pin code': userData.pincode.text.toString(),
                  'city': userData.city.text.toString(),
                  'state': userData.state.text.toString(),
                  'image': userData.imageUrl,
                  'order': {
                    'order company': userData.companyname.toString(),
                    'order address': userData.orderadd.toString(),
                    'order detail': userData.detail.toString(),
                    'order time': userData.time.toString(),
                  },
                }).then(
                  (value) =>
                      Navigator.of(context).pushReplacementNamed('home'),
                );
              }
            },
            child: Card(
              elevation: 5,
              child: Container(
                height: displaywidth * 0.06,
                width: displaywidth * 0.4,
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1, fontSize: 15),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            (userData.orderAccept == true) ? Container() : Orders(),
          ],
        ),
      ),
    );
  }
}
