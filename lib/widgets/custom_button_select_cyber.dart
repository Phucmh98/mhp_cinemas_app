import 'package:flutter/material.dart';

class CustomButtonSelectCyber extends StatelessWidget {
  final String text1;
  final TextStyle style1;
  final String text2;
  final TextStyle style2;
  final String text3;
  final TextStyle style3;
  final String text4;
  final TextStyle style4;
  final double width;
  final double height;

  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color backgroundColor3;
  final Color borderColor1;
  final Color borderColor2;

  // final VoidCallback onPressed;

  const CustomButtonSelectCyber({
    super.key,
    required this.text1,
    required this.style1,
    required this.text2,
    required this.style2,
    required this.text3,
    required this.style3,
    required this.text4,
    required this.style4,
    required this.width,
    required this.height,
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.backgroundColor3,
    required this.borderColor1,
    required this.borderColor2,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            borderColor1,
            borderColor1,
            borderColor2,
            borderColor2,
          ],
        ),
        borderRadius: BorderRadius.circular(height / 6 + 2),
      ),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundColor1,
                backgroundColor2,
              ],
            ),
            borderRadius: BorderRadius.circular(height / 6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: backgroundColor3,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(height / 6),
                        topRight: Radius.circular(height / 6))),
                child: Text(
                  text1,
                  style: style1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  text2,
                  style: style2,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  text3,
                  style: style3,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  text4,
                  style: style4,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )),
    );
  }
}
