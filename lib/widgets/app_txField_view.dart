import 'package:flutter/material.dart';

class TxFieldView extends StatefulWidget {
  final String imageIcon;
  final String hintTx;
  IconData? sufIcon;
  VoidCallback? showIcon;
  bool isShowPass;
  final TextEditingController controller;

    TxFieldView({
    super.key,
    required this.imageIcon,
    required this.hintTx,
    this.sufIcon,
    this.showIcon,
    this.isShowPass = false,
    required this.controller,
  });

  @override
  State<TxFieldView> createState() => _TxFieldViewState();
}

class _TxFieldViewState extends State<TxFieldView> {
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: _focusNodes[0].hasFocus
            ? LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 252, 210, 55),
                  Color.fromARGB(255, 252, 210, 55),
                  Color.fromARGB(255, 221, 90, 18),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff85F4FF),
                  const Color(0xff85F4FF),
                  Color.fromARGB(255, 45, 134, 175),
                  
                  
                ],
              ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(2),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xFF453E59),
        ),
        child: TextFormField(
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          focusNode: _focusNodes[0],
          // autofocus: true,
          obscureText: widget.isShowPass,
          decoration: InputDecoration(
            hintText: widget.hintTx,
            hintStyle: const TextStyle(
              color: Color(0xffc8c8c8),
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.all(12),
              child: Image.asset(
                widget.imageIcon,
                width: 20,
                height: 20,
                color: _focusNodes[0].hasFocus
                    ? Color.fromARGB(255, 252, 210, 55)
                    : Colors.white,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: widget.showIcon,
              icon: Icon(
                widget.sufIcon,
                color: _focusNodes[0].hasFocus
                    ? Color.fromARGB(255, 252, 210, 55)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
