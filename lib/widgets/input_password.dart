import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class InputPassword extends StatefulWidget {
  final String textHint;
  final TextEditingController textInput;
  final double width;
  final Color borderColor1;
  final Color borderColor2;
  final Color borderColorFocus1;
  final Color borderColorFocus2;
  final Icon icon;

  const InputPassword({
    super.key,
    required this.textHint,
    required this.textInput,
    required this.width,
    required this.borderColor1,
    required this.borderColor2,
    required this.borderColorFocus1,
    required this.borderColorFocus2,
    required this.icon,
  });
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
          controller: widget.textInput,
          obscureText: passwordVisible,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: GradientOutlineInputBorder(
                gradient: LinearGradient(
                    colors: [widget.borderColor1, widget.borderColor2]),
                width: 2,
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: [
                    widget.borderColorFocus1,
                    widget.borderColorFocus2
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  width: 2),
              filled: true,
              fillColor: const Color(0xFF453E59),
              hintText: widget.textHint,
              hintStyle: const TextStyle(color: Color(0xFFC8C8C8)),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 17),
                child: widget.icon,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility_outlined,
                  color: const Color(0xFFC8C8C8),
                ),
              ))),
    );
  }
}
