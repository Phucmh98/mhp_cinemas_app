import 'package:flutter/material.dart';

class CheckBoxRememberView extends StatefulWidget {
  const CheckBoxRememberView({super.key});

  @override
  State<CheckBoxRememberView> createState() => _CheckBoxRememberViewState();
}

class _CheckBoxRememberViewState extends State<CheckBoxRememberView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isCheck = !isCheck;
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffCA1D8A),
            ),
            child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: isCheck == true
                      ? const Color(0xffCA1D8A)
                      : const Color(0xff130B2B),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: isCheck == true ? Colors.white : Colors.transparent,
                  ),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Remember me",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xffffffff).withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
