import 'package:flutter/material.dart';
import 'package:super_mart/screen/homepage.dart';
import 'package:super_mart/screen/orderpage.dart';
import 'package:super_mart/screen/pandingpage.dart';
import 'package:super_mart/screen/profilepage.dart';
import 'package:super_mart/widgets/nevbar.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Nevbar(),
        body: PageView(controller: _controller, children: const [
          HomePage(),
          OrderPage(),
          PendingPage(),
          Profilepage(),
        ]));
  }
}
