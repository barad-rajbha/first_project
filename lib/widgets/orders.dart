import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('asset/img/1.png'),
                ),
              ),
            ),
            SizedBox(
              width:  displaywidth * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:  displaywidth * 0.005,
                  ),
                  Text(
                    'Puma Shoes',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '📍 dr.yagnik road rajkot, 360001\n⏱️ 03-jan-2022',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height:  displaywidth * 0.005,
                  ),
                  Row(
                    children: [
                      Card(
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
                          )),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        width:  displaywidth * 0.010,
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
