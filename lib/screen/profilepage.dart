import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:super_mart/controller/controller.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.height;
    UserData data = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile 🙎🏻‍♂️'),
      ),
      body: StreamBuilder(
        stream: data.fetchProfileData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final doc = documents[index];
              final docid = doc.id;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                                          data.galleryimg();
                                        },
                                        child: CircleAvatar(
                                          radius: displaywidth * 0.03,
                                          backgroundColor:
                                              Color.fromARGB(255, 128, 60, 187),
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
                                          data.cameraimg();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(255, 128, 60, 187),
                                          radius: 30,
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
                          (data.imageFile == null)
                              ? const CircleAvatar(
                                  radius: 70,
                                  backgroundColor:
                                      Color.fromARGB(255, 128, 60, 187),
                                  child: Icon(Icons.person, size: 80),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundImage: FileImage(data.imageFile!),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      doc['Name'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Edit Profile'),
                              content: SizedBox(
                                width: displaywidth * 0.5,
                                height: displaywidth * 0.5,
                                child: ListView(
                                  children: <Widget>[
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('Name'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: data.name,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          prefixIcon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: doc['Name'],
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('Address'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: data.address,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          prefixIcon:
                                              Icon(Icons.location_on_outlined),
                                          hintText: doc['Addresse'],
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('City'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: data.city,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          prefixIcon:
                                              Icon(Icons.location_on_outlined),
                                          hintText: doc['City'],
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('Mubile Number'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: data.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          prefixIcon: Icon(Icons.phone),
                                          hintText: doc['Mobile Number'],
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('Pincode'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: data.pincode,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          prefixIcon:
                                              Icon(Icons.pinch_outlined),
                                          hintText: doc['Pincode'],
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    data.upDataProfile(context, docid);
                                  },
                                  child: Text(
                                    'ok',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Card(
                        elevation: 5,
                        color: Color.fromARGB(255, 0, 126, 230),
                        child: SizedBox(
                          height: displaywidth * 0.04,
                          width: displaywidth * 0.12,
                          child: Center(
                              child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: displaywidth * 0.7,
                      width: double.infinity,
                      child: Column(
                        children: data.settingList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 5,
                              child: SizedBox(
                                height: displaywidth * 0.08,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      e['titelicon'],
                                      color: e['color'],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      e['titel'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                        color: e['color'],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(e['actoinicon']),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
