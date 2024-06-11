import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpaleshPage extends StatefulWidget {
  const SpaleshPage({super.key});

  @override
  State<SpaleshPage> createState() => _SpaleshPageState();
}

class _SpaleshPageState extends State<SpaleshPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: Lottie.asset('asset/json/spalesh.json', repeat: false),
        ),
      ),
    );
  }
}
