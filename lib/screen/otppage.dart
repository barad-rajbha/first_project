import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    var otps = Provider.of<UserData>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('asset/img/bg.jpeg'),
        ),
      ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                height: 190,
                width: 190,
                child: Lottie.asset('asset/json/Animation - 1717590142914.json',
                    repeat: false),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'SUBMIT OTP!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 30, bottom: 20, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Enter Otp'),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp1,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp2,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp3,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp4,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp5,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: TextField(
                                controller: otps.otp6,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                otps.otp1.clear();
                                otps.otp2.clear();
                                otps.otp3.clear();
                                otps.otp4.clear();
                                otps.otp5.clear();
                                otps.otp6.clear();
                              },
                              child: const Text(
                                'clear',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Resend otp?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('account');
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
