import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_mart/screen/accountpage.dart';
import 'package:super_mart/screen/canceldeliverypage.dart';
import 'package:super_mart/screen/completedeliverypage.dart';
import 'package:super_mart/screen/detail.dart';
import 'package:super_mart/screen/mainpage.dart';
import 'package:super_mart/screen/otppage.dart';
import 'package:super_mart/screen/returnpage.dart';
import 'package:super_mart/screen/spalesh.dart';
import 'package:super_mart/screen/welcomepage.dart';
import 'controller/controller.dart';
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
        theme: (Provider.of<UserData>(context).theme == true)
            ? ThemeData.dark()
            : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        initialRoute: 'spalesh',
        routes: {
          '/': (context) => const WelcomePage(),
          'otp': (context) => OtpPage(verificationId: ''),
          'account': (context) => const AccountPage(),
          'spalesh': (context) => const SpaleshPage(),
          'completed': (context) => const CompleteDeliveryPage(),
          'canceled': (context) => const CancelDeliveryPage(),
          'return': (context) => const ReturnPage(),
          'main': (context) => Mainpage(),
        },
      ),
    );
  }
}
