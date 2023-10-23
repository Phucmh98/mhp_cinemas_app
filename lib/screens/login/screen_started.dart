import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/screens/login/screen_sign_in.dart';

import '../../widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenStarted(),
    );
  }
}

class ScreenStarted extends StatefulWidget {
  @override
  State<ScreenStarted> createState() => _HomepageState();
}

class _HomepageState extends State<ScreenStarted> {
  List itemColors = [Colors.green, Colors.purple, Colors.blue];
  List<String> imageUrls = [
    'lib/resource/images/background_movie.png',
    'lib/resource/images/background_movie.png',
    'lib/resource/images/background_movie.png',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white, // Màu nền của Container
              width: double.infinity,
              height: double.infinity,
              child: CarouselSlider(
                items: [
                  for (int i = 0; i < imageUrls.length; i++)
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        imageUrls[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      // print(reason.toString());
                      currentIndex = index;
                    });
                  },
                  autoPlay: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Welcome to MHP \nCinemas",
                    style: AppFonts.robotoW700(fontSize: 32, color: Color(0xFFFFFFFF)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The best movie ticket booking app of the century to make your days great! ",
                    style: AppFonts.robotoW500(fontSize: 20, color: Color(0xFFFFFFFF)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < itemColors.length; i++)
                        Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            gradient: currentIndex == i
                                ? LinearGradient(
                                    colors: [
                                      Color(0xFFB6116B),
                                      Color(0xFF3B1578)
                                    ], // Màu sắc gradient
                                  )
                                : null,
                            color: currentIndex != i ? Colors.white : null,
                            shape: BoxShape.circle,
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: CustomButton(
                      width: width - 50,
                      height: 55,
                      backgroundColor1: Color.fromARGB(255, 252, 210, 55),
                      backgroundColor2: Color.fromARGB(255, 221, 90, 18),
                      borderColor1: Color.fromARGB(255, 252, 210, 55),
                      borderColor2: Color.fromARGB(255, 221, 90, 18), 
                      text: "Get Started",
                      textColor: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.screenSignin,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
