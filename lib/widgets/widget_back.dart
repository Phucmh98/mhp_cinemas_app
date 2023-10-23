import 'package:flutter/material.dart';

class WidgetBack extends StatelessWidget {
  const WidgetBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff60FFCA),
              const Color(0xff60FFCA),
              const Color(0xff60FFCA).withOpacity(0),
              const Color(0xff60FFCA).withOpacity(0),
              const Color(0xFFffffff).withOpacity(0.3),
            ],
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF5D5671),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
