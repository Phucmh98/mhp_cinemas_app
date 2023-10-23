import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';

class WidgetSocialView extends StatelessWidget {
  final String img;
  final String text;
  final double width;
  final VoidCallback? onTap;
  const WidgetSocialView(
      {super.key, required this.img, required this.text, this.onTap,required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 252, 210, 55).withOpacity(0.8),
              Color.fromARGB(255, 252, 210, 55),
              Color.fromARGB(255, 221, 90, 18),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff130B2B),
          ),
          child: Container(
            
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset(
                    img,
                    alignment: Alignment.center,
                    height: 22,
                    width: 22,
                    // color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 23,
                ),
                Expanded(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.poppinsW500(fontSize: 17, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
