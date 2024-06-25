import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpaleshPage extends StatefulWidget {
  const SpaleshPage({super.key});

  @override
  State<SpaleshPage> createState() => _SpaleshPageState();
}

class _SpaleshPageState extends State<SpaleshPage> {
  var getnumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      (FirebaseAuth.instance.currentUser != null)
          ? Navigator.of(context).pushReplacementNamed('main')
          : Navigator.of(context).pushReplacementNamed('/');
    });
    // getdata();
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

  // void getdata() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   UserData.prefNumber = prefs.getString('firebasenumber')!;
  // }
}
