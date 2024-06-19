import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: data.orderslist.map(
            (e) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: displaywidth * 0.015,
                          ),
                          Container(
                            height: displaywidth * 0.150,
                            width: displaywidth * 0.100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(e.image),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: displaywidth * 0.015,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: displaywidth * 0.005,
                                ),
                                Text(
                                  e.company,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${e.address}\n⏱️ ${e.time}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: displaywidth * 0.005,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        data.orderAccepted(e);
                                        data.addInCartDelivery(e);
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: Container(
                                          height: displaywidth * 0.040,
                                          width: displaywidth * 0.110,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                  BorderRadius.circular(10)),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
          ).toList(),
        ),
      ),
    );
  }
}
//ListView(
//           children: orderslist.map(
//             (e) {
//               String img = e['image'];
//               String com = e['company'];
//               String add = e['address'];
//               String time = e['time'];
//               bool accept = e['accept'];
//               int orderid = e['orderid'];
//               return (accept == false)
//                   ? Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Orders(
//                           img: img,
//                           com: com,
//                           add: add,
//                           time: time,
//                           accept: accept,
//                           orderid: orderid),
//                     )
//                   : Container();
//             },
//           ).toList(),
//         ),
