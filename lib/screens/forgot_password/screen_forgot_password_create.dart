import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/widgets/input_password.dart';

import '../../widgets/custom_button.dart';

class ScreenForgotPasswordCreate extends StatefulWidget {
  const ScreenForgotPasswordCreate({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenForgotPasswordCreate> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenForgotPasswordCreate> {
  TextEditingController password = new TextEditingController();
  TextEditingController passwordComfirm = new TextEditingController();
  bool actionSubmit = true;
  bool isChecked = false;
  bool isInputFocused = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return Color(0xFFB6116B);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Password',
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width - 50,
                  child: Text(
                    'Create Your New Password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: width - 50,
                  child: Text(
                    'Choose a password that must have at least 8 characters with at least one Capital letter, lower letter and at least 1 digit.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFBDBDBD)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: width - 50,
                  child: Text(
                    'New Password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 5),
                InputPassword(
                  width: width - 50,
                  borderColor1: Color(0xFF60FFCA),
                  borderColor2: Color(0xFF453E59),
                  borderColorFocus1: Color(0xFFFF53C0),
                  borderColorFocus2: Color(0xFF453E59),
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xFFC8C8C8),
                  ),
                  textHint: 'Password',
                  textInput: password,
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerLeft,
                  width: width - 50,
                  child: Text(
                    'Re-enter new password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 5),
                InputPassword(
                  width: width - 50,
                  borderColor1: Color(0xFF60FFCA),
                  borderColor2: Color(0xFF453E59),
                  borderColorFocus1: Color(0xFFFF53C0),
                  borderColorFocus2: Color(0xFF453E59),
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xFFC8C8C8),
                  ),
                  textHint: 'Confirm Password',
                  textInput: passwordComfirm,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Color(0xFFB6116B)),
                        ),
                        activeColor: Color(0xFFB6116B),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  child: CustomButton(
                    width: width - 50,
                    height: 60,
                    backgroundColor1: Color.fromARGB(255, 252, 210, 55),
                  backgroundColor2: Color.fromARGB(255, 221, 90, 18),
                  borderColor1: Color.fromARGB(255, 252, 210, 55),
                  borderColor2: Color.fromARGB(255, 221, 90, 18),
                    text: "Submit",
                    textColor: Colors.white,
                  ),
                  onTap: () async{
                    if (password.text.isEmpty || passwordComfirm.text.isEmpty||password.text != passwordComfirm.text) {
                      AppFounction.showCustomDialogFail(
                        context,
                        "Error",
                        "Password and Confirm Password do not match.",
                      );
                    } else {
                      AppFounction.showCustomDialogSucces(
                        context,
                        "Congratulations!",
                        "Your account is ready to use. You will be redirected to the Home page in a few seconds.",
                        false,
                      );
                       await Future.delayed(Duration(milliseconds: 1200)); // Thời gian chờ 2 giây
                      Navigator.pushNamed(context, AppRoute.dashBroard);
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: width - 50,
                  child: Text(
                    'To make sure your account is secure, you’ll be logged out from other devices once you set the new password.',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFBDBDBD)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
