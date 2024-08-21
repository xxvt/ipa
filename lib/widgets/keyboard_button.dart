import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KeyboardButton extends StatefulWidget {
  final String text;
  final void Function(String) onTap;

  KeyboardButton({required this.text, required this.onTap});

  @override
  _KeyboardButtonState createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> {
  double fontSize = 18.sp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          widget.onTap(widget.text);
          fontSize = 40.sp;
        });
      },
      onTapUp: (details) {
        setState(() {
          fontSize = 18.sp;
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 50),
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.grey.withOpacity(0.1),
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
