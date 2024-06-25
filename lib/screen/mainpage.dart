import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:super_mart/screen/homepage.dart';
import 'package:super_mart/screen/orderpage.dart';
import 'package:super_mart/screen/pandingpage.dart';
import 'package:super_mart/screen/profilepage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10.0,
        color: Colors.grey,
        textStyle: TextStyle(fontSize: 17, color: Colors.blue),
        iconSize: 30,
        activeColor: Colors.blue,
        tabBackgroundColor: Color.fromARGB(92, 86, 162, 225),
        padding: EdgeInsets.all(8),
        tabMargin: EdgeInsets.all(8),
        onTabChange: onTabTapped,
        selectedIndex: _currentIndex,
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: 'home',
          ),
          GButton(
            icon: Icons.fire_truck_rounded,
            text: 'Order',
          ),
          GButton(
            icon: Icons.pending_actions_rounded,
            text: 'pending',
          ),
          GButton(
            icon: Icons.person_rounded,
            text: 'profile',
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: const [
          HomePage(),
          OrderPage(),
          PendingPage(),
          Profilepage(),
        ],
      ),
    );
  }
}
