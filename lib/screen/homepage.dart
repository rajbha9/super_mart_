import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_mart/controller/controller.dart';
import 'package:super_mart/screen/detail.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    var prefs = await SharedPreferences.getInstance();
    UserData.prefNumber = prefs.getString('firebasenumber')!;
  }

  @override
  Widget build(BuildContext context) {
    UserData data = Provider.of<UserData>(context);
    double displaywidth = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                data.changeThemedata();
              },
              icon: Icon(Icons.change_circle)),
          SizedBox(
            width: displaywidth * 0.01,
          )
        ],
        title: const Text('Dashboard'),
      ),
      drawer: const DrawerData(),
      body: PageView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: displaywidth * 0.430,
                  width: double.infinity,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('completed');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              width: displaywidth * 0.15,
                              height: displaywidth * 0.15,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 22, 103, 164),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: displaywidth * 0.075,
                                    width: displaywidth * 0.075,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'asset/img/complete (1).png'))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Complete Delivery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('completed');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              width: displaywidth * 0.15,
                              height: displaywidth * 0.15,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 176, 164, 31),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: displaywidth * 0.075,
                                    width: displaywidth * 0.075,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'asset/img/preorder.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: displaywidth * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Pending Delivery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('canceled');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              width: displaywidth * 0.15,
                              height: displaywidth * 0.15,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 201, 27),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: displaywidth * 0.075,
                                    width: displaywidth * 0.075,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('asset/img/cancel.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: displaywidth * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Cancel Delivery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('return');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              width: displaywidth * 0.15,
                              height: displaywidth * 0.15,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 218, 0, 204),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: displaywidth * 0.075,
                                    width: displaywidth * 0.075,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('asset/img/return.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: displaywidth * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      'Return Delivery',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: displaywidth * 0.02,
                ),
                const Text(
                  'New Orders',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: displaywidth * 0.02,
                ),
                StreamBuilder(
                  stream: data.fetchOrders(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Column(
                      children: snapshot.data!.docs.map((doc) {
                        // String idname = doc.id;
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailPage(
                                    customerNum: doc['deliveryPhone'],
                                    orderId: doc['orderId'],
                                    deliveryMode: doc['deliveryMode'],
                                    image: doc['orderItems'][0]['productImage'],
                                    price: doc['orderItems'][0]['productPrice']
                                        .toString(),
                                    productName: doc['orderItems'][0]
                                        ['productName'],
                                    userAddress: doc['userAddress'],
                                    userName: doc['userName'],
                                    paymentMode: doc['paymentMode'],
                                  );
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            doc['orderItems'][0]
                                                ['productImage'],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('OrderID : '),
                                            Text(doc['orderId']),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Customer Number : '),
                                            Text(doc['deliveryPhone']),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Delivery Mode📍 : ',
                                            ),
                                            Text(
                                              doc['deliveryMode'],
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 250,
                                                child: Text(doc['orderItems'][0]
                                                    ['productName']),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Rs : ',
                                              style: TextStyle(
                                                fontSize: 27,
                                              ),
                                            ),
                                            Text(
                                              doc['orderItems'][0]
                                                      ['productPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // data.orderAccepted(e);
                                                data.addInCartDelivery(doc);
                                              },
                                              child: Card(
                                                elevation: 5,
                                                child: Container(
                                                  height: displaywidth * 0.040,
                                                  width: displaywidth * 0.110,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                    child: Text(
                                                      'Accept',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: 1,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: displaywidth * 0.010,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // data.orderCanceled(e);
                                              },
                                              child: Card(
                                                elevation: 5,
                                                child: Container(
                                                  height: displaywidth * 0.040,
                                                  width: displaywidth * 0.110,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                      child: Text(
                                                    'Reject',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        letterSpacing: 1,
                                                        fontSize: 15),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
