import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_mart/controller/controller.dart';

class CancelDeliveryPage extends StatefulWidget {
  const CancelDeliveryPage({super.key});

  @override
  State<CancelDeliveryPage> createState() => _CancelDeliveryPageState();
}

class _CancelDeliveryPageState extends State<CancelDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    double displaywidth = MediaQuery.of(context).size.height;
    UserData data = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Delivery'),
      ),
      body: StreamBuilder(
        stream: data.fetchOrders(),
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
              return (doc['orderCancel'] == 'Yes')
                  ? Card(
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
                                      doc['orderItems'][0]['productImage'],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          child: Text(doc['orderItems'][0]
                                              ['productName']),
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
                                        doc['orderItems'][0]['productPrice']
                                            .toString(),
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
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }
}
