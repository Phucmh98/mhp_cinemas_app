import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';

import 'package:flutter_cinema_06/provider/user_register_provider_cyber.dart';
import 'package:flutter_cinema_06/screens/login/screen_login.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';

import 'package:flutter_cinema_06/widgets/app_btn_view.dart';
import 'package:flutter_cinema_06/widgets/app_txField_view.dart';
import 'package:flutter_cinema_06/widgets/box_logo_view.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

//Hàm kiểm tra số điện thoại nhập vào
bool validatePhoneNumber(String phoneNumber) {
  RegExp regex = RegExp(r'^[0-9]{10}$');
  return regex.hasMatch(phoneNumber);
}

class ScreenCreateAccount extends StatefulWidget {
  const ScreenCreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenCreateAccount> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenCreateAccount> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();
  bool registerAction = false;
  bool isShowPass = true;
  bool actionCreate = true;
  bool isChecked = false;
  bool isInputFocused = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return Color.fromARGB(255, 221, 90, 18);
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.mhp_logo),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TxFieldView(
                    imageIcon: AppImages.icUser,
                    hintTx: "User",
                    controller: user,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TxFieldView(
                    controller: password,
                    imageIcon: AppImages.icLock,
                    hintTx: "Password",
                    isShowPass: isShowPass,
                    sufIcon:
                        isShowPass ? Icons.visibility_off : Icons.visibility,
                    showIcon: () {
                      isShowPass = !isShowPass;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TxFieldView(
                    controller: passwordConfirm,
                    imageIcon: AppImages.icLock,
                    hintTx: "Password Confirm",
                    isShowPass: isShowPass,
                    sufIcon:
                        isShowPass ? Icons.visibility_off : Icons.visibility,
                    showIcon: () {
                      isShowPass = !isShowPass;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TxFieldView(
                    imageIcon: AppImages.icEmail,
                    hintTx: "Email",
                    controller: userEmail,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TxFieldView(
                    imageIcon: AppImages.icPhone,
                    hintTx: "Phone Number",
                    controller: phone,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TxFieldView(
                    imageIcon: AppImages.icName,
                    hintTx: "Name",
                    controller: userName,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 221, 90, 18)),
                        ),
                        activeColor: Color.fromARGB(255, 221, 90, 18),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppBtnView(
                    title: "Sign up",
                    onTap: () async {
                      if (userEmail.text.trim().isEmpty ||
                          passwordConfirm.text.trim().isEmpty ||
                          password.text.trim().isEmpty ||
                          passwordConfirm.text != password.text ||
                          user.text.trim().isEmpty ||
                          userName.text.trim().isEmpty ||
                          phone.text.trim().isEmpty) {
                        AppFounction.showCustomDialogFail(
                            context,
                            "Registration failed",
                            "Please check your information again!");
                      } else {
                        UserRegisterCyber register =
                            Provider.of<UserRegisterCyber>(context,
                                listen: false);
                        register.registerUserCyber(
                            context,
                            user.text.trim(),
                            password.text.trim(),
                            userEmail.text.trim(),
                            phone.text.trim(),
                            'GP00',
                            userName.text.trim());
                       
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width - 70,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Color.fromARGB(255, 221, 90, 18),
                        )),
                        const SizedBox(width: 10),
                        const Text(
                          'or continue with',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Color.fromARGB(255, 221, 90, 18),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child:
                              BoxLogoView(image: AppImages.icFb, onTap: () {}),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: BoxLogoView(
                              image: AppImages.icGoogle, onTap: () {}),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: BoxLogoView(
                              image: AppImages.icApple, onTap: () {}),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account ? ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 252, 210, 55),
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScreenLogin()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF453E59),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
