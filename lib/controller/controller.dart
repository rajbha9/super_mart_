import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserData extends ChangeNotifier {
  static const getnumber = '';
  File? imageFile;
  String? imageUrl;
  static String prefNumber = '';
  TextEditingController number = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  String orderadd = '📍 dr.yagnik road rajkot, 360001';
  String companyname = 'Puma';
  String detail = 'Puma shoes 8';
  String time = '03-jan-2022';
  bool theme = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // List<Orders> orderslist = [
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yaganik road rajkot, 360001',
  //       company: 'Puma Shoes',
  //       image: 'asset/img/1.png',
  //       time: '30-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 ring road rajkot, 360001',
  //       company: 'Nike Shoes',
  //       image:
  //           'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
  //       time: '20-feb-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 150 fit road rajkot, 360001',
  //       company: 'Puma T-shirt',
  //       image: 'asset/img/pp-removebg-preview.png',
  //       time: '15-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 amin marg road rajkot, 360001',
  //       company: 'Nike T-shirt',
  //       image: 'asset/img/nike-removebg-preview.png',
  //       time: '6-jun-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yagnik road rajkot, 360001',
  //       company: 'U.S. Polo Shirt',
  //       image: 'asset/img/tomiy-removebg-preview.png',
  //       time: '03-des-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yaganik road rajkot, 360001',
  //       company: 'Puma Shoes',
  //       image: 'asset/img/1.png',
  //       time: '30-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 ring road rajkot, 360001',
  //       company: 'Nike Shoes',
  //       image:
  //           'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
  //       time: '20-feb-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 150 fit road rajkot, 360001',
  //       company: 'Puma T-shirt',
  //       image: 'asset/img/pp-removebg-preview.png',
  //       time: '15-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 amin marg road rajkot, 360001',
  //       company: 'Nike T-shirt',
  //       image: 'asset/img/nike-removebg-preview.png',
  //       time: '6-jun-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yagnik road rajkot, 360001',
  //       company: 'U.S. Polo Shirt',
  //       image: 'asset/img/tomiy-removebg-preview.png',
  //       time: '03-des-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yaganik road rajkot, 360001',
  //       company: 'Puma Shoes',
  //       image: 'asset/img/1.png',
  //       time: '30-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 ring road rajkot, 360001',
  //       company: 'Nike Shoes',
  //       image:
  //           'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
  //       time: '20-feb-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 150 fit road rajkot, 360001',
  //       company: 'Puma T-shirt',
  //       image: 'asset/img/pp-removebg-preview.png',
  //       time: '15-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 amin marg road rajkot, 360001',
  //       company: 'Nike T-shirt',
  //       image: 'asset/img/nike-removebg-preview.png',
  //       time: '6-jun-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yagnik road rajkot, 360001',
  //       company: 'U.S. Polo Shirt',
  //       image: 'asset/img/tomiy-removebg-preview.png',
  //       time: '03-des-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yaganik road rajkot, 360001',
  //       company: 'Puma Shoes',
  //       image: 'asset/img/1.png',
  //       time: '30-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 ring road rajkot, 360001',
  //       company: 'Nike Shoes',
  //       image:
  //           'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
  //       time: '20-feb-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 150 fit road rajkot, 360001',
  //       company: 'Puma T-shirt',
  //       image: 'asset/img/pp-removebg-preview.png',
  //       time: '15-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 amin marg road rajkot, 360001',
  //       company: 'Nike T-shirt',
  //       image: 'asset/img/nike-removebg-preview.png',
  //       time: '6-jun-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yagnik road rajkot, 360001',
  //       company: 'U.S. Polo Shirt',
  //       image: 'asset/img/tomiy-removebg-preview.png',
  //       time: '03-des-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yaganik road rajkot, 360001',
  //       company: 'Puma Shoes',
  //       image: 'asset/img/1.png',
  //       time: '30-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 ring road rajkot, 360001',
  //       company: 'Nike Shoes',
  //       image:
  //           'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
  //       time: '20-feb-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 150 fit road rajkot, 360001',
  //       company: 'Puma T-shirt',
  //       image: 'asset/img/pp-removebg-preview.png',
  //       time: '15-jan-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 amin marg road rajkot, 360001',
  //       company: 'Nike T-shirt',
  //       image: 'asset/img/nike-removebg-preview.png',
  //       time: '6-jun-2022'),
  //   Orders(
  //       accept: false,
  //       address: '📍 dr.yagnik road rajkot, 360001',
  //       company: 'U.S. Polo Shirt',
  //       image: 'asset/img/tomiy-removebg-preview.png',
  //       time: '03-des-2022'),
  // ];

  dynamic galleryimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    imageFile = File(path);
    uploadImage();
    notifyListeners();
  }

  dynamic cameraimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.camera);
    String path = res!.path;
    imageFile = File(path);
    uploadImage();
    notifyListeners();
  }

  uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    String path = DateTime.now().millisecond.toString();

    Reference ref = storage.ref().child('image').child('$path.jpg');

    TaskSnapshot uploadTask = await ref.putFile(imageFile!);

    imageUrl = await uploadTask.ref.getDownloadURL();
    firestore
        .collection('users')
        .doc('+91$prefNumber')
        .collection('Profile')
        .doc('1')
        .update({
      'profile photo': imageUrl,
    });
    print('++++++++++++++++++++11111$imageFile 111111++++++++++++++++++++++');

    print(
        '++++++++++++++++++++++++22222$imageUrl 22222+++++++++++++++++++++++');
    notifyListeners();
  }

  // List orderAcceptList = [];
  // List orderRejectList = [];

  // orderAccepted(Orders data) {
  //   orderslist.remove(data);
  //   notifyListeners();
  // }

  // orderCanceled(Orders data) {
  //   orderRejectList.add(data);
  //   orderslist.remove(data);
  //   notifyListeners();
  // }

  changeThemedata() async {
    theme = !theme;
    notifyListeners();
  }
  // fetchingOrders(){
  //   FirebaseAuth.instance
  // }

  addProfileDetailonFirebase(BuildContext context) async {
    DateTime timenow = DateTime.now();

    if (name == '' ||
        number == '' ||
        email == '' ||
        address == '' ||
        pincode == '' ||
        city == '' ||
        state == '') {
      print('**************************************');
    } else {
      await firestore
          .collection('users')
          .doc('+91${number.text}')
          .collection('Profile')
          .doc('1')
          .set({
        'Name': name.text.toString(),
        'Mobile Number': number.text.toString(),
        'Addresse': address.text.toString(),
        'Pincode': pincode.text.toString(),
        'City': city.text.toString(),
        'State': state.text.toString(),
        'Landmark': city.text.toString(),
        'profile photo': "$imageUrl"
      }).then((value) {
        if (imageUrl == null) {
          print(
              '******************************************1111111111111111111111111111111111111');
        } else {
          print(
              '-----------------------------------------22222222222222222222222');
        }
        Navigator.of(context).pushReplacementNamed('main');
      });
    }
  }

  addInCartDelivery(data) async {
    DateTime timenow = DateTime.now();
    String time = '${timenow.month}-${timenow.year}';
    await firestore
        .collection('users')
        .doc('+91$prefNumber')
        .collection('cart')
        .doc(time)
        .collection('orders')
        .doc()
        .set({
      'Order Id ': data['orderId'],
      'customer number': data['deliveryPhone'],
      'product image': data['orderItems'][0]['productImage'],
      'product price': data['orderItems'][0]['productPrice'],
      'product name': data['orderItems'][0]['productName'],
      'dilivery mode': data['deliveryMode'],
    });
  }

  // rejectForDelivery(Orders data) async {
  //   DateTime timenow = DateTime.now();
  //   String time = '${timenow.day}-${timenow.month}';
  //   await firestore
  //       .collection('users')
  //       .doc('+91${number.text}')
  //       .collection('cart')
  //       .doc('Rejected')
  //       .collection(time)
  //       .doc()
  //       .set({
  //     'product company': data.company,
  //     'product address': data.address,
  //     'product image': data.image,
  //     'time': data.time,
  //     'accept': data.accept
  //   });
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    DateTime timenow = DateTime.now();
    String time = '${timenow.month}-${timenow.year}';
    return firestore
        .collection('users')
        .doc('+91$prefNumber')
        .collection('cart')
        .doc(time)
        .collection('orders')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProfileData() {
    return firestore
        .collection('users')
        .doc('+91$prefNumber')
        .collection('Profile')
        .snapshots();
  }

  upDataProfile(BuildContext context, String docid) {
    firestore
        .collection('users')
        .doc('+91$prefNumber')
        .collection('Profile')
        .doc(docid)
        .update({
      'Name': name.text.toString(),
      'Mobile Number': number.text.toString(),
      'Addresse': address.text.toString(),
      'Pincode': pincode.text.toString(),
      'City': city.text.toString(),
      'State': state.text.toString(),
      'Landmark': city.text.toString(),
    }).then(
      (value) => Navigator.of(context).pop(),
    );
  }

  List<Map<String, dynamic>> settingList = [
    {
      'titel': 'Basic Informetoin',
      'titelicon': Icons.info_outline,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Job Informetoin',
      'titelicon': Icons.location_city,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Location Detail',
      'titelicon': Icons.location_on_outlined,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Document',
      'titelicon': Icons.edit_document,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Privacy and Security',
      'titelicon': Icons.private_connectivity,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Settings',
      'titelicon': Icons.settings_suggest_outlined,
      'actoinicon': Icons.arrow_forward_ios
    },
    {
      'titel': 'Log Out',
      'titelicon': Icons.logout,
      'color': Colors.red,
      'actoinicon': Icons.arrow_forward_ios
    },
  ];
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchOrders() {
    DateTime timenow = DateTime.now();
    DateTime twoMonthsAgo = timenow.subtract(Duration(days: 60));
    print('**************{$twoMonthsAgo}***************');
    String year = '${timenow.year}';
    String month = '${timenow.month}';

    return FirebaseFirestore.instance
        .collection('users')
        .doc('+918888888888')
        .collection('orders')
        .doc(year)
        .collection(month)
        .snapshots();
  }
}
