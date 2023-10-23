import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';

class CustomButtonBook extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color textColor;
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color borderColor1;
  final Color borderColor2;

  // final VoidCallback onPressed;

  const CustomButtonBook({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.textColor,
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.borderColor1,
    required this.borderColor2,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            borderColor1,
            borderColor2,
          ],
        ),
        borderRadius: BorderRadius.circular(height),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              backgroundColor1,
              backgroundColor2,
            ],
          ),
          borderRadius: BorderRadius.circular(height),
        ),
        child: AutoSizeText(
          text,
          style: TextStyle(fontSize: 18, color: textColor),
          maxLines: 1, // Đặt số dòng tối đa cho văn bản
          minFontSize: 8, // Kích thước font nhỏ nhất
          stepGranularity: 2, // Kích thước bước tăng/giảm font
        ),
      ),
    );
  }
}
