import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/provider/thong_tin_lich_chieu_provider_cyber.dart';

import 'package:flutter_cinema_06/screens/login/screen_create_account.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:flutter_cinema_06/widgets/app_txField_view.dart';
import 'package:flutter_cinema_06/widgets/box_logo_view.dart';
import 'package:flutter_cinema_06/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/list_film_cyber_propvider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenLogin> {
  TextEditingController userNameEmail = TextEditingController();
  TextEditingController passwordEmail = TextEditingController();
  bool isShowpass = true;
  bool actionLogin = true;
  bool isChecked = false;
  bool isInputFocused = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return const Color.fromARGB(255, 221, 90, 18);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.hideLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFF130B2B),
        
        body: Stack(
          children: [
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
                            image: AssetImage(
                              AppImages.mhp_logo,
                            ),
                          fit: BoxFit.cover                          
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Login to Your Account",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TxFieldView(
                        imageIcon: AppImages.icUser,
                        hintTx: "User",
                        controller: userNameEmail,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TxFieldView(
                        imageIcon: AppImages.icLock,
                        hintTx: "Password",
                        isShowPass: isShowpass,
                        controller: passwordEmail,
                        sufIcon: isShowpass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        showIcon: () {
                          isShowpass = !isShowpass;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isChecked,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side:
                                    const BorderSide(color: Color(0xFFB6116B)),
                              ),
                              activeColor: const Color(0xFFB6116B),
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
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        child: CustomButton(
                          width: width - 50,
                          height: 60,
                          backgroundColor1: const Color.fromARGB(255, 252, 210, 55),
                          backgroundColor2: const Color.fromARGB(255, 221, 89, 18),
                          borderColor1: const Color.fromARGB(255, 252, 210, 55),
                          borderColor2: const Color.fromARGB(255, 221, 90, 18),
                          text: "Sign in",
                          textColor: Colors.white,
                        ),
                        onTap: () async {
                          if (userNameEmail.text.trim().isNotEmpty &&
                              passwordEmail.text.trim().isNotEmpty) {
                            ApiResponse res = await ApiRequest.userLoginCyber(
                                userNameEmail.text.trim(),
                                passwordEmail.text.trim());
                            // print(res.message);
                            if (res.result == true) {
                              String token = res.data["content"]["accessToken"];
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString('jwt', token);

                              DataMovieCyberProvider dataCyberMovieProvider =
                                  Provider.of<DataMovieCyberProvider>(context,
                                      listen: false);
                              await dataCyberMovieProvider.getDataFilmCyber(
                                  context, 'GP00','');

                              await Navigator.pushNamed(
                                  context, AppRoute.dashBroard);

                              // AppFounction.showCustomDialogSucces(
                              //     context,
                              //     'Congratulations!',
                              //     'Your account is ready to use. You will be redricted to the Home page in a few seconds.',
                              //     false);
                              // Navigator.pushNamed(context, AppRoute.dashBroard);
                            } else {
                              setState(() {
                                actionLogin = false;
                              });
                              AppFounction.showCustomDialogFail(
                                context,
                                "Login Fail",
                                "Incorrect password or phone number",
                              );
                            }
                          } else {
                            setState(() {
                              actionLogin = false;
                            });
                            AppFounction.showCustomDialogFail(
                              context,
                              "Login Fail",
                              "Please enter correct Phone Number & Password",
                            );
                          }
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: InkWell(
                          child: const Text(
                            "Forgot the password?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 221, 90, 18)),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.screenForgotPassword,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: width - 70,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 1,
                              color: const Color.fromARGB(255, 221, 90, 18),
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
                              color: const Color.fromARGB(255, 221, 90, 18),
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
                              child: BoxLogoView(
                                  image: AppImages.icFb, onTap: () {}),
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
                          text: "Don’t have an account ? ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign up",
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
                                        builder: (context) =>
                                            const ScreenCreateAccount()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
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
          ],
        ));
  }
}
