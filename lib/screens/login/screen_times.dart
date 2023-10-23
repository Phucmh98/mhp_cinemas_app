import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/screens/login/screen_started.dart';



class ScreenTimes extends StatefulWidget {
  const ScreenTimes({Key? key, }) : super(key: key);

  

  @override
  State<ScreenTimes> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenTimes> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      // Chuyển sang màn hình thứ hai
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScreenStarted()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://wallpapers.com/images/high/space-phone-1440-x-2560-background-y4j2wi52qlj8udnw.webp'), // Đường dẫn đến hình ảnh
                fit: BoxFit.cover,
                 // Tùy chọn cách hình ảnh được sử dụng để lấp đầy không gian
              ),
            ),
          ),
          Positioned(
            top:height/2 - 200/2,
            left: width/2 - 200/2,
            child: 
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    AppImages.mhp_logo), 
                fit: BoxFit.cover,
              ),
            ),
          ),),
          
        ],
      ),
    );
  }
}
