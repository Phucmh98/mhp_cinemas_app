import 'package:flutter/material.dart';

class TextFormFile extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;

  TextFormFile({Key? key, required this.hint, this.controller}) : super(key: key);

  @override
  _TextFormFileState createState() => _TextFormFileState();
}

class _TextFormFileState extends State<TextFormFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            const Color(0xff60FFCA).withOpacity(0.1),
            const Color(0xff60FFCA),
            const Color(0xff60FFCA),
            const Color(0xff60FFCA).withOpacity(0.1),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff130B2B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          onChanged: (newValue) {
            if (widget.controller != null) {
              widget.controller!.text = newValue; // Cập nhật giá trị của controller
            }
          },
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: const EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 10),
          ),
        ),
      ),
    );
  }
}
