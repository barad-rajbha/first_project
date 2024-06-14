import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';
import '../utils/util.dart';
import '../widgets/orders.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pushNamed('home');
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
          children: orderslist.map(
            (e) {
              String img = e['image'];
              String com = e['company'];
              String add = e['address'];
              String time = e['time'];
              bool accept = e['accept'];
              int orderid = e['orderid'];
              return (accept == false)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Orders(
                          img: img,
                          com: com,
                          add: add,
                          time: time,
                          accept: accept,
                          orderid: orderid),
                    )
                  : Container();
            },
          ).toList(),
        ),
      ),
    );
  }
}
