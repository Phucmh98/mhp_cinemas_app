import 'package:flutter/material.dart';

class BoxLogoView extends StatelessWidget {
  final String image;
  VoidCallback onTap;
  BoxLogoView({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1),
        // margin: EdgeInsets.symmetric(horizontal: 22),
        width: width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff85F4FF).withOpacity(0.5),
              const Color(0xff85F4FF).withOpacity(0),
              const Color(0xff85F4FF).withOpacity(0),
              const Color(0xff85F4FF).withOpacity(0.5),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff130B2B),
          ),
          child: Center(
            child: Image.asset(
              image,
              width: 22,
              height: 22,
            ),
          ),
        ),
      ),
    );
  }
}
