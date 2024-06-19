import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';
import 'otppage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    UserData numberdata = Provider.of<UserData>(context);
    double displaywidth = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('asset/img/bg.jpeg'),
        ),
      ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: displaywidth * .03,
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          letterSpacing: 1.5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displaywidth * 0.15,
              ),
              SizedBox(
                height: displaywidth * 0.19,
                width: displaywidth * 0.19,
                child: Lottie.asset('asset/json/Animation - 1717589236584.json',
                    repeat: false),
              ),
              SizedBox(
                height: displaywidth * 0.01,
              ),
              const Text(
                'Welcome Back!',
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: displaywidth * 0.025,
                        ),
                        const Text('Phone Number'),
                        SizedBox(
                          height: displaywidth * 0.005,
                        ),
                        // TextField(
                        //   controller: name,
                        // ),
                        TextFormField(
                          validator: (vel) {
                            if (vel!.isEmpty) {
                              return 'Enter your number';
                            } else if (vel.length != 10) {
                              return 'Enter your full and proper number';
                            }
                            return null;
                          },
                          maxLength: 10,
                          // controller: name,
                          controller: numberdata.number,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'number',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance
                                .verifyPhoneNumber(
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed:
                                        (FirebaseAuthException ex) {
                                      print('*******************8$ex***********************');
                                        },
                                    codeSent: (String verificatoinid,
                                        int? resendtoken) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OtpPage(
                                              verificationId: verificatoinid),
                                        ),
                                      );
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificatoinId) {},
                                    phoneNumber:
                                        '+91 ${numberdata.number.text.toString()}')
                                .then(
                              (value) {
                                (numberdata.number.text.length == 10)
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('OTP send success fully'),
                                          backgroundColor: Colors.green,
                                        ),
                                      )
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Fill proper detail...'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                              },
                            );
                          },
                          child: Container(
                            height: displaywidth * 0.065,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'SEND OTP',
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
