import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_mart/screen/detail.dart';
import '../controller/controller.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    UserData data = Provider.of<UserData>(context);
    double displaywidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
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
          return Column(
            children: snapshot.data!.docs.map((doc) {
              // String idname = doc.id;
              return (doc['deliveryStatus'] == false &&
                      doc['orderCancel'] == 'No')
                  ? InkWell(
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
                        child: SizedBox(
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
                                        doc['orderItems'][0]['productImage'],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Rs : ',
                                          style: TextStyle(
                                            fontSize: 27,
                                          ),
                                        ),
                                        Text(
                                          doc['orderItems'][0]['productPrice']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 24, color: Colors.red),
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
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }
}
