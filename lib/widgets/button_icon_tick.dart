import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ButtonIconTick extends StatelessWidget {
  final double width;
  final double height;
  final String img;
  final String text;
  final Icon icon;
  final Color backgroundColor;
  
  final Color borderColor1;
  final Color borderColor2;
  // final VoidCallback onPressed;

  const ButtonIconTick({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.img,
    required this.text,
    required this.icon,
    
    required this.borderColor1,
    required this.borderColor2, 
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            borderColor1,
            borderColor2,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(height / 3),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(
                    img,
                    height: 46,
                    width: 46,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: width-150,
                    child: AutoSizeText(
                    text,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        minFontSize: 10,
                        stepGranularity: 0.1,
                  ),
                  )
                ],
              ),
            ),
            Icon(
              icon.icon,
              color: Color(0xFF5FFFCA),
            )
          ],
        ),
      ),
    );
  }
}
