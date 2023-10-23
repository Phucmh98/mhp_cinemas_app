import 'package:flutter/material.dart';

class WidgetImgText extends StatelessWidget {
  final String img;
  final String text;
  

  const WidgetImgText({
    Key? key,
    required this.img,
    required this.text,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(         
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          Container(
            padding: const EdgeInsets.only(top:7),
            child: Image.asset(img),),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.75
              ),
              softWrap: true,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
