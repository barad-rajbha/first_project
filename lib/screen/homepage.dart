import 'package:flutter/material.dart';
import 'package:uireprika/widgets/nevbar.dart';
import '../utils/util.dart';
import '../widgets/drawer.dart';
import '../widgets/orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: nevbar(),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                height: displaywidth * 0.02,
                width: displaywidth * 0.02,
                child: Image.asset('asset/img/bell.png')),
          ),
          SizedBox(
            width: displaywidth * 0.01,
          )
        ],
        title: Text('Dashboard'),
      ),
      drawer: DrawerData(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: displaywidth * 0.430,
              width: double.infinity,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: displaywidth * 0.15,
                        height: displaywidth * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xFFE4F2FD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: displaywidth * 0.075,
                              width: displaywidth * 0.075,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'asset/img/complete (1).png'))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Complete Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: displaywidth * 0.15,
                        height: displaywidth * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFDE7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: displaywidth * 0.075,
                              width: displaywidth * 0.075,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('asset/img/preorder.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.01,
                            ),
                            Text(
                              'Pending Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: displaywidth * 0.15,
                        height: displaywidth * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7F6E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: displaywidth * 0.075,
                              width: displaywidth * 0.075,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('asset/img/cancel.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.01,
                            ),
                            Text(
                              'Cancel Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: displaywidth * 0.15,
                        height: displaywidth * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBE4EC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: displaywidth * 0.075,
                              width: displaywidth * 0.075,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('asset/img/return.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.01,
                            ),
                            Text(
                              'Return Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: displaywidth * 0.02,
            ),
            Text(
              'New Orders',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: displaywidth * 0.02,
            ),
            Container(
              child: Column(
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
                                accept: accept,orderid: orderid),
                          )
                        : Container();
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
