import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  String orderId;
  String customerNum;
  String deliveryMode;
  String image;
  String price;
  String productName;
  String userAddress;
  String userName;
  String paymentMode;

  ProductDetailPage({
    super.key,
    required this.customerNum,
    required this.orderId,
    required this.deliveryMode,
    required this.image,
    required this.price,
    required this.productName,
    required this.userName,
    required this.userAddress,
    required this.paymentMode,
  });

  @override
  Widget build(BuildContext context) {
    final doc = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Hero(
            tag: image,
            child: SizedBox(
              // height: 400,
              // width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 1,
            minChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 228, 228).withOpacity(0.6),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 40,
                            color: const Color.fromARGB(255, 83, 83, 83),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'User Name : '),
                                TextSpan(text: userName),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'User Address : '),
                                TextSpan(text: userAddress),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Order Id : '),
                                TextSpan(text: orderId),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Payment Method : '),
                                TextSpan(text: paymentMode),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Customer Number: '),
                                TextSpan(text: customerNum),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Delivery Mode : '),
                                TextSpan(text: deliveryMode),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Product Name : '),
                                TextSpan(text: productName),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(text: 'Product Price : '),
                                TextSpan(text: price),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
