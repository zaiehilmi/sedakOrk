import 'package:flutter/material.dart';

class RectangularTextfield extends StatelessWidget {
  static const double textSize = 15;

  String hint;
  TextEditingController controller;
  Color? bgColor;
  Color? textColor;

  RectangularTextfield({
    super.key,
    required this.hint,
    required this.controller,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: TextField(
        style: TextStyle(
          fontSize: textSize,
          color: textColor ?? colorTheme.onPrimaryContainer,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: textSize, fontWeight: FontWeight.normal),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
        ),
        controller: controller,
      ),
    );
  }
}
