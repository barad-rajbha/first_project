import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';
import 'package:uireprika/screen/accountpage.dart';
import 'package:uireprika/screen/homepage.dart';
import 'package:uireprika/screen/orderpage.dart';
import 'package:uireprika/screen/welcomepage.dart';
import 'package:uireprika/screen/otppage.dart';
import 'package:uireprika/screen/spalesh.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserData(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'spalesh',
        routes: {
          '/': (context) => const WelcomePage(),
          'otp': (context) => OtpPage(verificationId: ''),
          'account': (context) => const AccountPage(),
          'spalesh': (context) => const SpaleshPage(),
          'home': (context) => const HomePage(),
          'order': (context) => const OrderPage(),
        },
      ),
    );
  }
}
