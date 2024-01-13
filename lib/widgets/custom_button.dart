import 'package:flutter/material.dart';
import 'package:test/utils/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          ),
    );
  }
}
