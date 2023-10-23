import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class InputTextTrans extends StatefulWidget {
  final String textHint;
  final String textTitle;
  final double width;
  final TextEditingController textInput;
  final bool passwordAccount;

  const InputTextTrans({
    Key? key,
    required this.textHint,
    required this.textTitle,
    required this.width,
    required this.textInput,
    required this.passwordAccount,
  }) : super(key: key);

  @override
  _InputTextTransState createState() => _InputTextTransState();
}

class _InputTextTransState extends State<InputTextTrans> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.textTitle,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                const Color(0xff5C5C5C).withOpacity(0.63),
                const Color(0xff7F7F7F).withOpacity(0.14),
              ],)),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: LinearGradient(colors: [
                  const Color(0xff5C4488).withOpacity(0.14),
                  const Color(0xff301F6B).withOpacity(0.63),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 19,
                    spreadRadius: -5,
                    color: const Color(0xff000000).withOpacity(0.25),
                    offset: const Offset(18, 15),
                  ),
                ],
              ),
              child: Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: widget.textInput,
                  obscureText: widget.passwordAccount ? true : false,
                  decoration: InputDecoration(
                    hintText: widget.textHint,
                    hintStyle: TextStyle(
                      color: Color(0xffA4C8FF).withOpacity(0.3),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
