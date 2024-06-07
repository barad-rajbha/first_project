import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';
import 'package:uireprika/screen/otppage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserData numberdata = Provider.of<UserData>(context);
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
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          letterSpacing: 1.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                height: 190,
                width: 190,
                child: Lottie.asset('asset/json/Animation - 1717589236584.json',
                    repeat: false),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome Back!',
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
                    padding:
                    const EdgeInsets.only(top: 25, right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Phone Number'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: numberdata.number,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'number',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException ex) {},
                                codeSent:
                                    (String verificatoinid, int? resendtoken) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) =>
                                          OtpPage(
                                              verificationId: verificatoinid),));
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificatoinId) {},
                                phoneNumber: '+91 ${numberdata.number.text.toString()}');
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'SEND OTP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
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
