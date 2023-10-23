import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_create.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/custom_button.dart';

class ScreenForgotPasswordEmail extends StatefulWidget {
  const ScreenForgotPasswordEmail({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenForgotPasswordEmail> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenForgotPasswordEmail> {
  int countDown = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  void startCountDown() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (countDown == 0) {
          timer.cancel();
        } else {
          countDown--;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                  alignment: Alignment.center,
                  width: width - 50,
                  child: Text(
                    'Code has been send to',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width - 50,
                  child: Text(
                    'maddy***9@gmail.com',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: width - 50,
                  child: Pinput(
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: PinTheme(
                      height: 68,
                      width: 62,
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF60FFCA)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    text: "Resend code in ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '${countDown}',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color(0xFFDF1893),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " s",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                InkWell(
                  child: CustomButton(
                    width: width - 50,
                    height: 60,
                    backgroundColor1: Color(0xFFB6116B),
                    backgroundColor2: Color(0xFF3B1578),
                    borderColor1: Color(0xFFFF53C0),
                    borderColor2: Colors.transparent,
                    text: "Verify",
                    textColor: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ScreenForgotPasswordCreate()),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
