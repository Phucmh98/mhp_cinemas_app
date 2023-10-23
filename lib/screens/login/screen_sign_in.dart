import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/screens/login/screen_create_account.dart';
import 'package:flutter_cinema_06/screens/login/screen_login.dart';
import 'package:flutter_cinema_06/widgets/widget_social_view.dart';
import '../../widgets/custom_button.dart';

class ScreenSignin extends StatefulWidget {
  const ScreenSignin({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenSignin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenSignin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 285,
                width: 285,
                child: Image.asset(
                  'lib/resource/images/image_login.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Let's you in",
                style:
                    AppFonts.robotoW600(fontSize: 36, color: const Color(0xFFFFFFFF)),
              ),
              const SizedBox(
                height: 15,
              ),
              WidgetSocialView(
                img: AppImages.icFb,
                text: "Continue with Facebook",
                width: width,
              ),
              const SizedBox(
                height: 15,
              ),
              WidgetSocialView(
                img: AppImages.icGoogle,
                text: "Continue with Google",
                width: width,
              ),
              const SizedBox(
                height: 15,
              ),
              WidgetSocialView(
                img: AppImages.icApple,
                text: "Continue with Apple",
                width: width,
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
                      color: const Color.fromARGB(255, 221, 90, 18),
                    )),
                    const SizedBox(width: 10),
                    const Text(
                      'or',
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
                height: 20,
              ),
              InkWell(
                child: CustomButton(
                  width: width - 50,
                  height: 55,
                  backgroundColor1: const Color.fromARGB(255, 252, 210, 55),
                  backgroundColor2: const Color.fromARGB(255, 221, 90, 18),
                  borderColor1: const Color.fromARGB(255, 252, 210, 55),
                  borderColor2: const Color.fromARGB(255, 221, 90, 18),
                  text: "Sign in with Password",
                  textColor: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenLogin()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account ? ",
                  style: AppFonts.poppinsW500(
                      fontSize: 14, color: const Color(0XFFFFFFFF).withOpacity(0.9)),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: AppFonts.poppinsW700(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 252, 210, 55)),
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
