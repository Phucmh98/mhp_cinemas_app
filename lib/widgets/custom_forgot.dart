import 'package:flutter/material.dart';

class CustomButtonForgot extends StatelessWidget {
  final String text1;
  final String text2;
  final double width;
  final double height;
  
  final Color backgroundColor;
 
  final Color borderColor1;
  final Color borderColor2;
  final Icon icon;
  // final VoidCallback onPressed;

  const CustomButtonForgot({
    required this.text1,
    required this.text2,
    required this.width,
    required this.height,
    
    required this.backgroundColor,
    
    required this.borderColor1,
    required this.borderColor2,
    required this.icon,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: height,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          
          colors: [
            borderColor1,
            borderColor2,
            
          ],
          
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF453E59),
                    ),
                    child: icon,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFC8C8C8)),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        text2,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
