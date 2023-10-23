import 'dart:convert';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_email.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_sms.dart';
import 'package:flutter_cinema_06/screens/login/screen_create_account.dart';
import 'package:flutter_cinema_06/widgets/app_txField_view.dart';

import 'package:flutter_cinema_06/widgets/custom_forgot.dart';

import '../../widgets/custom_button.dart';

class ScreenForgotPassword extends StatefulWidget {
  const ScreenForgotPassword({
    Key? key,
  }) : super(key: key);

  static String verify = "";

  @override
  State<ScreenForgotPassword> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenForgotPassword> {
  bool smsSend = true;
  var phone = '+84944889815';
  TextEditingController inputPhoneNumber = TextEditingController();

  String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.isEmpty) {
    return phoneNumber;
  }

  // Xóa bỏ các ký tự không phải số
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D+'), '');

  // Kiểm tra xem số điện thoại có chữ số đủ hay không
  if (digitsOnly.length < 10) {
    return phoneNumber;
  }

  // Thêm dấu "+" và mã quốc gia vào số điện thoại
  return '+84' + digitsOnly.substring(digitsOnly.length - 9);
}
  
  String obfuscatePhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 7) {
      return phoneNumber; // Không đủ số để ẩn
    }

    String obfuscated = phoneNumber.substring(0, 3); // Lấy 3 ký tự đầu tiên

    for (int i = 3; i < phoneNumber.length - 2; i++) {
      obfuscated += "*"; // Thay thế các ký tự còn lại thành *
    }

    obfuscated +=
        phoneNumber.substring(phoneNumber.length - 2); // Lấy 2 ký tự cuối cùng

    return obfuscated;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(inputPhoneNumber);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 20,
        leading: Container(
          margin: EdgeInsets.only(left: 20, top: 0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF60FFCA),
                    Color(0xFF453E59),
                    Color(0xFF453E59),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF453E59),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF130B2B),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'lib/resource/images/forgot_password.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: width - 50,
                  child: const Text(
                    'Select which contact details should we use to reset your password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                TxFieldView(
                  imageIcon: AppImages.icEmail,
                  hintTx: "Phone Number",
                  controller: inputPhoneNumber,
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: CustomButtonForgot(
                    width: width - 50,
                    height: 120,
                    backgroundColor: Color(0xFF2D1E41),
                    borderColor1:
                        smsSend ? Color.fromARGB(255, 252, 210, 55) : Color(0xff85F4FF),
                    borderColor2: smsSend
                        ? Color.fromARGB(255, 221, 90, 18)
                        : Color.fromARGB(255, 45, 134, 175),
                    text1: "via SMS",
                    text2: '${obfuscatePhoneNumber(formatPhoneNumber(inputPhoneNumber.text))}',
                    icon: Icon(
                      Icons.message,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    smsSend = true;
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  child: CustomButtonForgot(
                    width: width - 50,
                    height: 100,
                    backgroundColor: Color(0xFF2D1E41),
                    borderColor1:
                        smsSend ? Color(0xff85F4FF) : Color.fromARGB(255, 252, 210, 55),
                    borderColor2: smsSend
                        ? Color.fromARGB(255, 45, 134, 175)
                        : Color.fromARGB(255, 221, 90, 18),
                    text1: "via Email",
                    text2: "maddy***9@gmail.com",
                    icon: Icon(
                      Icons.mail,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    smsSend = false;
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  child: CustomButton(
                    width: width - 50,
                    height: 60,
                    backgroundColor1: Color.fromARGB(255, 252, 210, 55),
                  backgroundColor2: Color.fromARGB(255, 221, 90, 18),
                  borderColor1: Color.fromARGB(255, 252, 210, 55),
                  borderColor2: Color.fromARGB(255, 221, 90, 18),
                    text: "Continue",
                    textColor: Colors.white,
                  ),
                  onTap: () async {
                    smsSend
                        ? await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: phone,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              ScreenForgotPassword.verify = verificationId;
                              Navigator.pushNamed(
                                context,
                                AppRoute.screenForgotPasswordSMS,);
                              
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          )
                        : Navigator.pushNamed(
                            context,
                            AppRoute.screenForgotPasswordEmail,
                          );
                  },
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
