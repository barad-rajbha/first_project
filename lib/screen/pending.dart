import 'package:flutter/material.dart';

class PandingPage extends StatefulWidget {
  const PandingPage({super.key});

  @override
  State<PandingPage> createState() => _PandingPageState();
}

class _PandingPageState extends State<PandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Pending'),),);
  }
}
