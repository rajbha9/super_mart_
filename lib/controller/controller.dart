import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/orderdetails.dart';

class UserData extends ChangeNotifier {
  File? imageFile;
  String? imageUrl;
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
  List<Orders> orderslist = [
    Orders(
        accept: false,
        address: '📍 dr.yaganik road rajkot, 360001',
        company: 'Puma Shoes',
        image: 'asset/img/1.png',
        time: '30-jan-2022'),
    Orders(
        accept: false,
        address: '📍 ring road rajkot, 360001',
        company: 'Nike Shoes',
        image:
            'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
        time: '20-feb-2022'),
    Orders(
        accept: false,
        address: '📍 150 fit road rajkot, 360001',
        company: 'Puma T-shirt',
        image: 'asset/img/pp-removebg-preview.png',
        time: '15-jan-2022'),
    Orders(
        accept: false,
        address: '📍 amin marg road rajkot, 360001',
        company: 'Nike T-shirt',
        image: 'asset/img/nike-removebg-preview.png',
        time: '6-jun-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yagnik road rajkot, 360001',
        company: 'U.S. Polo Shirt',
        image: 'asset/img/tomiy-removebg-preview.png',
        time: '03-des-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yaganik road rajkot, 360001',
        company: 'Puma Shoes',
        image: 'asset/img/1.png',
        time: '30-jan-2022'),
    Orders(
        accept: false,
        address: '📍 ring road rajkot, 360001',
        company: 'Nike Shoes',
        image:
            'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
        time: '20-feb-2022'),
    Orders(
        accept: false,
        address: '📍 150 fit road rajkot, 360001',
        company: 'Puma T-shirt',
        image: 'asset/img/pp-removebg-preview.png',
        time: '15-jan-2022'),
    Orders(
        accept: false,
        address: '📍 amin marg road rajkot, 360001',
        company: 'Nike T-shirt',
        image: 'asset/img/nike-removebg-preview.png',
        time: '6-jun-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yagnik road rajkot, 360001',
        company: 'U.S. Polo Shirt',
        image: 'asset/img/tomiy-removebg-preview.png',
        time: '03-des-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yaganik road rajkot, 360001',
        company: 'Puma Shoes',
        image: 'asset/img/1.png',
        time: '30-jan-2022'),
    Orders(
        accept: false,
        address: '📍 ring road rajkot, 360001',
        company: 'Nike Shoes',
        image:
            'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
        time: '20-feb-2022'),
    Orders(
        accept: false,
        address: '📍 150 fit road rajkot, 360001',
        company: 'Puma T-shirt',
        image: 'asset/img/pp-removebg-preview.png',
        time: '15-jan-2022'),
    Orders(
        accept: false,
        address: '📍 amin marg road rajkot, 360001',
        company: 'Nike T-shirt',
        image: 'asset/img/nike-removebg-preview.png',
        time: '6-jun-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yagnik road rajkot, 360001',
        company: 'U.S. Polo Shirt',
        image: 'asset/img/tomiy-removebg-preview.png',
        time: '03-des-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yaganik road rajkot, 360001',
        company: 'Puma Shoes',
        image: 'asset/img/1.png',
        time: '30-jan-2022'),
    Orders(
        accept: false,
        address: '📍 ring road rajkot, 360001',
        company: 'Nike Shoes',
        image:
            'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
        time: '20-feb-2022'),
    Orders(
        accept: false,
        address: '📍 150 fit road rajkot, 360001',
        company: 'Puma T-shirt',
        image: 'asset/img/pp-removebg-preview.png',
        time: '15-jan-2022'),
    Orders(
        accept: false,
        address: '📍 amin marg road rajkot, 360001',
        company: 'Nike T-shirt',
        image: 'asset/img/nike-removebg-preview.png',
        time: '6-jun-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yagnik road rajkot, 360001',
        company: 'U.S. Polo Shirt',
        image: 'asset/img/tomiy-removebg-preview.png',
        time: '03-des-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yaganik road rajkot, 360001',
        company: 'Puma Shoes',
        image: 'asset/img/1.png',
        time: '30-jan-2022'),
    Orders(
        accept: false,
        address: '📍 ring road rajkot, 360001',
        company: 'Nike Shoes',
        image:
            'asset/img/PNG_Image_Of_Running_Shoes_With_A_Clear_Background_-_Image_ID_18586_png_-_Free_PNG_Images-removebg-preview.png',
        time: '20-feb-2022'),
    Orders(
        accept: false,
        address: '📍 150 fit road rajkot, 360001',
        company: 'Puma T-shirt',
        image: 'asset/img/pp-removebg-preview.png',
        time: '15-jan-2022'),
    Orders(
        accept: false,
        address: '📍 amin marg road rajkot, 360001',
        company: 'Nike T-shirt',
        image: 'asset/img/nike-removebg-preview.png',
        time: '6-jun-2022'),
    Orders(
        accept: false,
        address: '📍 dr.yagnik road rajkot, 360001',
        company: 'U.S. Polo Shirt',
        image: 'asset/img/tomiy-removebg-preview.png',
        time: '03-des-2022'),
  ];

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

    print(imageUrl);
  }

  // List orderAcceptList = [];
  // List orderRejectList = [];

  orderAccepted(Orders data) {
    orderslist.remove(data);
    notifyListeners();
  }

  // orderCanceled(Orders data) {
  //   orderRejectList.add(data);
  //   orderslist.remove(data);
  //   notifyListeners();
  // }

  changeThemedata() async {
    theme = !theme;
    notifyListeners();
  }

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
      }).then((value) {
        Navigator.of(context).pushNamed('main');
      });
    }
  }

  addInCartDelivery(Orders data) async {
    DateTime timenow = DateTime.now();
    String time = '${timenow.month}-${timenow.year}';
    await firestore
        .collection('users')
        .doc('+91${number.text}')
        .collection('cart')
        .doc(time)
        .collection('orders')
        .doc()
        .set({
      'product company': data.company,
      'product address': data.address,
      'product image': data.image,
      'time': data.time,
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
        .doc('+916263646500')
        .collection('cart')
        .doc(time)
        .collection('orders')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProfileData() {
    return firestore
        .collection('users')
        .doc('+916263646500')
        .collection('Profile')
        .snapshots();
  }

  upDataProfile(BuildContext context, String docid) {
    firestore
        .collection('users')
        .doc('+916263646500')
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
}