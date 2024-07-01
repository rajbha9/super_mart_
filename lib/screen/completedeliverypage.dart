import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';

class CompleteDeliveryPage extends StatefulWidget {
  const CompleteDeliveryPage({super.key});

  @override
  State<CompleteDeliveryPage> createState() => _CompleteDeliveryPageState();
}

class _CompleteDeliveryPageState extends State<CompleteDeliveryPage> {
  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.height;
    UserData data = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Delivery'),
      ),
      body: StreamBuilder(
        stream: data.getData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                elevation: 5,
                child: Container(
                  height: 160,
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
                                doc['product image'],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('OrderID : '),
                                Text(doc['Order Id ']),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Customer Number : '),
                                Text(doc['customer number']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Delivery Mode📍 : ',
                                ),
                                Text(
                                  doc['dilivery mode'],
                                  style: TextStyle(color: Colors.red),
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
                                    child: Text(doc['product name']),
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Rs : ',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  doc['product price'].toString(),
                                  style: TextStyle(
                                      fontSize: 34, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
