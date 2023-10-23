import 'package:flutter/material.dart';

class CustomButtonLoginWith extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Image img;
  final Color textColor;

  final Color backgroundColor;
  final Color borderColor1;
  final Color borderColor2;
  // final VoidCallback onPressed;

  const CustomButtonLoginWith({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.img,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor1,
    required this.borderColor2,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            borderColor1,
            borderColor2,
          ],
        ),
        borderRadius: BorderRadius.circular(height / 3),
      ),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height / 3 - 2),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: img,
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 10,
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                  )),
            ],
          )),
    );
  }
}
