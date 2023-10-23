import 'package:flutter/material.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ButtonBgTrans extends StatelessWidget {
  final double width;
  final double height;

  final String text;

  final Color backgroundColor;
  final Color borderColor1;
  final Color borderColor2;
  final Color textColor;

  // final VoidCallback onPressed;

  const ButtonBgTrans({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    required this.borderColor1,
    required this.borderColor2,
    required this.textColor,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 20,top: 30),
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            borderColor1,
            borderColor2,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(height / 2.5),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor),
        ),
      ),
    );
  }
}
