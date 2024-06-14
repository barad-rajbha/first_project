import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';
import '../utils/util.dart';

class Orders extends StatefulWidget {
  String img;
  String com;
  String add;
  String time;
  bool accept;
  int orderid;

  Orders({
    super.key,
    required this.img,
    required this.com,
    required this.add,
    required this.time,
    required this.accept,
    required this.orderid,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
    return Card(
      elevation: 5,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: displaywidth * 0.015,
            ),
            Container(
              height: displaywidth * 0.150,
              width: displaywidth * 0.100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.img),
                ),
              ),
            ),
            SizedBox(
              width: displaywidth * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displaywidth * 0.005,
                  ),
                  Text(
                    widget.com,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.add}\n⏱️ ${widget.time}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: displaywidth * 0.005,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async{
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
                                'order company': widget.com,
                                'order address': widget.add,
                                'order time': widget.time,
                                'order img': widget.img,
                              },
                            });
                          }
                          orderslist.removeAt(widget.orderid);
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: displaywidth * 0.040,
                            width: displaywidth * 0.110,
                            child: Center(
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: displaywidth * 0.010,
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: displaywidth * 0.040,
                          width: displaywidth * 0.110,
                          child: Center(
                              child: Text(
                            'Reject',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 15),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
