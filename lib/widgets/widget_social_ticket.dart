import 'package:flutter/material.dart';

class WidgetSocialTicket extends StatelessWidget {
  final String img;
  final String text;
  final double width;

  const WidgetSocialTicket({
    required this.img,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 250,
      height: 460,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              img,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
