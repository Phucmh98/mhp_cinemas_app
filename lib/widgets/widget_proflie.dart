import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';

// ignore: must_be_immutable
class WidgetProfile extends StatelessWidget {
  final String title;
  final String img;
  VoidCallback? onTap;
  WidgetProfile(
      {super.key, required this.title, required this.img, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.only(left: 3, right: 3, top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: Colors.black,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                img,
                alignment: Alignment.center,
                width: 32,
                height: 32,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 7,
              child: Text(
                title,
                style: AppFonts.robotoW500(fontSize: 18, color: Colors.white),
              ),
            ),
            Expanded(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
