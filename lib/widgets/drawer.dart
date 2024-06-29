import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.height;
    UserData data = Provider.of<UserData>(context);
    return Drawer(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    data.name.clear();
                    data.number.clear();
                    data.email.clear();
                    data.address.clear();
                    data.city.clear();
                    data.pincode.clear();
                    data.state.clear();
                    data.imageFile = null;
                    data.imageUrl = '';
                    print(
                        '**************************${data.imageFile}***********************************');
                    Navigator.of(context).pushReplacementNamed('/');
                  });
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: displaywidth * 0.05,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA22641),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                        ),
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
