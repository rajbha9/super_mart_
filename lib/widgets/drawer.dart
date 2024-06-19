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
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      height: displaywidth * 0.22,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    data.galleryimg();
                                  },
                                  child: CircleAvatar(
                                    radius: displaywidth * 0.03,
                                    backgroundColor:
                                        Colors.green.withOpacity(0.5),
                                    child: const Icon(Icons.photo, size: 30),
                                  ),
                                ),
                                SizedBox(width: displaywidth * 0.015),
                                const Text(
                                  'Choice photo from gallery',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: displaywidth * 0.02,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    data.cameraimg();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.green.withOpacity(0.5),
                                    radius: 30,
                                    child: const Icon(Icons.camera_alt_outlined,
                                        size: 30),
                                  ),
                                ),
                                SizedBox(width: displaywidth * 0.015),
                                const Text(
                                  'Click photo',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (data.imageFile == null)
                        ? const CircleAvatar(
                            radius: 70,
                            backgroundColor: Color.fromARGB(255, 102, 169, 105),
                            child: Icon(Icons.person, size: 80),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage: FileImage(data.imageFile!),
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('profile');
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Profile',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
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
                    height: 50,
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
