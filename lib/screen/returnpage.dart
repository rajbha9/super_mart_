import 'package:flutter/material.dart';

class ReturnPage extends StatefulWidget {
  const ReturnPage({super.key});

  @override
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  @override
  Widget build(BuildContext context) {
    // double displaywidth = MediaQuery.of(context).size.height;
    // UserData data = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Delivery'),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ListView(
      //       children: data.orderRejectList.map((e) {
      //     return Card(
      //       elevation: 5,
      //       child: Container(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(
      //               width: displaywidth * 0.015,
      //             ),
      //             Container(
      //               height: displaywidth * 0.150,
      //               width: displaywidth * 0.100,
      //               decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                   image: AssetImage(e.image),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: displaywidth * 0.015,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(
      //                     height: displaywidth * 0.005,
      //                   ),
      //                   Text(
      //                     e.company,
      //                     style: TextStyle(
      //                         fontSize: 25, fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     '${e.address}\n⏱️ ${e.time}',
      //                     style: TextStyle(fontSize: 15),
      //                   ),
      //                   SizedBox(
      //                     height: displaywidth * 0.005,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Card(
      //                         elevation: 5,
      //                         child: Container(
      //                           height: displaywidth * 0.050,
      //                           width: displaywidth * 0.210,
      //                           child: Center(
      //                             child: Text(
      //                               'Completed',
      //                               style: TextStyle(
      //                                   color: Colors.white,
      //                                   letterSpacing: 2,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 17),
      //                             ),
      //                           ),
      //                           decoration: BoxDecoration(
      //                               color: Colors.black,
      //                               borderRadius: BorderRadius.circular(50)),
      //                         ),
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   }).toList()),
      // ),
    );
  }
}
