import 'package:flutter/material.dart';
import 'package:sedakork/util/setting_constant.dart';

class RectangularTextfield extends StatelessWidget {
  static const double textSize = 15;

  String hint;
  TextEditingController controller;
  Color? bgColor;
  Color? textColor;
  bool outline;

  RectangularTextfield({
    super.key,
    required this.hint,
    required this.controller,
    this.bgColor,
    this.textColor,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: (outline) ? Border.all(color: colorScheme(context).outline): null,
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: TextField(
        style: TextStyle(
          fontSize: textSize,
          color: textColor ?? colorScheme(context).onPrimaryContainer,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: textSize, fontWeight: FontWeight.normal),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
        ),
        controller: controller,
      ),
    );
  }
}
