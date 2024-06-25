import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class OtpPage extends StatefulWidget {
  String verificationId;

  OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    var otps = Provider.of<UserData>(context);
    double displaywidth = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('asset/img/bg.jpeg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: displaywidth * 0.02,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    icon: const Icon(
                      Icons.chevron_left_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: displaywidth * .150,
              ),
              SizedBox(
                height: displaywidth * 0.190,
                width: displaywidth * 0.190,
                child: Lottie.asset('asset/json/Animation - 1717590142914.json',
                    repeat: false),
              ),
              SizedBox(
                height: displaywidth * 0.001,
              ),
              const Text(
                'SUBMIT OTP!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: displaywidth * 0.075,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  height: displaywidth * 0.280,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 30, bottom: 20, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ SizedBox(
                          height: displaywidth * 0.025,
                        ),
                        const Text('Enter Otp'),
                        SizedBox(
                          height: displaywidth * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                controller: otps.otp1,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                controller: otps.otp2,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                controller: otps.otp3,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                controller: otps.otp4,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                onChanged: (value) {
                                  FocusScope.of(context).nextFocus();
                                },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                controller: otps.otp5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displaywidth * 0.040,
                              width: displaywidth * 0.040,
                              child: TextField(
                                // onChanged: (value) {
                                //   FocusScope.of(context).nextFocus();
                                // },
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                controller: otps.otp6,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 40),
                                  hintText: ' *',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                otps.otp1.clear();
                                otps.otp2.clear();
                                otps.otp3.clear();
                                otps.otp4.clear();
                                otps.otp5.clear();
                                otps.otp6.clear();
                              },
                              child: const Text(
                                'clear',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Resend otp?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: widget.verificationId,
                                      smsCode:
                                          otps.otp1.text.toString() + otps.otp2.text.toString() + otps.otp3.text.toString() + otps.otp4.text.toString() + otps.otp5.text.toString() + otps.otp6.text.toString());
                              FirebaseAuth.instance
                                  .signInWithCredential(credential)
                                  .then((value) {
                                otps.otp1.clear();
                                otps.otp2.clear();
                                otps.otp3.clear();
                                otps.otp4.clear();
                                otps.otp5.clear();
                                otps.otp6.clear();
                                Navigator.of(context)
                                    .pushReplacementNamed('account');
                              });
                            } catch (ex) {
                              log('$ex');
                            }
                          },
                          child: Container(
                            height: displaywidth * 0.065,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
