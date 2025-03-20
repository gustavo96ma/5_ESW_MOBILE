import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onPressed;
  final Color buttonColor;

  const Button(
      {super.key,
      required this.text,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.onPressed,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(buttonWidth, buttonHeight)),
          backgroundColor: WidgetStatePropertyAll(buttonColor)),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(color: Color(0xffd4cebe), fontWeight: FontWeight.bold),
      ),
    );
  }
}
