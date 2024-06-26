import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserData providerdata = Provider.of<UserData>(context, listen: false);
    double displaywidth = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('asset/img/bg.jpeg'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Profile !!',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              width: double.infinity,
              height: displaywidth * 0.99,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, right: 30, left: 30),
                child: ListView(
                  children: [
                    const Text(
                      'Profile Photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.01,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          providerdata.galleryimg();
                                        },
                                        child: CircleAvatar(
                                          radius: displaywidth * 0.03,
                                          backgroundColor:
                                              Colors.green.withOpacity(0.5),
                                          child:
                                              const Icon(Icons.photo, size: 30),
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
                                          providerdata.cameraimg();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.green.withOpacity(0.5),
                                          radius: displaywidth * 0.03,
                                          child: const Icon(
                                              Icons.camera_alt_outlined,
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
                          (providerdata.imageFile == null)
                              ? const CircleAvatar(
                                  radius: 70,
                                  child: Icon(Icons.person, size: 80),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      FileImage(providerdata.imageFile!),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.01,
                    ),
                    const Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.name,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                        hintText: 'Enter your full name...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.number,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Enter your verify number...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your email...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'Address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.address,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined),
                        hintText: 'Enter your address...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'Pin code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.pincode,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_pin_circle_outlined),
                        hintText: 'Enter your pin code...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.city,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        hintText: 'Enter your city name...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displaywidth * 0.015,
                    ),
                    const Text(
                      'State',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: displaywidth * 0.005,
                    ),
                    TextFormField(
                      controller: providerdata.state,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.real_estate_agent_outlined),
                        hintText: 'Enter your state...',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                      ),
                    ),SizedBox(
                      height: displaywidth * 0.03,
                    ),
                    InkWell(
                      onTap: () async {
                        providerdata.addProfileDetailonFirebase(context);
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setString('firebasenumber',
                            providerdata.number.text.toString());
                      },
                      child: Container(
                        height: displaywidth * 0.065,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),SizedBox(
                      height: displaywidth * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
