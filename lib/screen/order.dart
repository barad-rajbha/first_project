import 'package:flutter/material.dart';
import '../widgets/orders.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Orders(),
            SizedBox(
              height: 10,
            ),
            Orders(),
            SizedBox(
              height: 10,
            ),
            Orders(),
            SizedBox(
              height: 10,
            ),
            Orders(),
            SizedBox(
              height: 10,
            ),
            Orders(),
            SizedBox(
              height: 10,
            ),
            Orders(),
          ],
        ),
      ),
    );
  }
}
