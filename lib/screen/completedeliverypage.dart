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
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                elevation: 5,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              doc['product company'],
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${doc['product address']}\n⏱️ ${doc['time']}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: displaywidth * 0.005,
                            )
                          ],
                        ),
                      )
                    ],
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
