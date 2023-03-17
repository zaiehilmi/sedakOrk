import 'package:flutter/material.dart';

class RectangularTextfield extends StatelessWidget {
  static const double textSize = 23;
  String hint;

  RectangularTextfield({super.key, required this.hint});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF06449),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white.withOpacity(0.5),
          //     blurRadius: 10.0,
          //     spreadRadius: 5.0,
          //   ),
          // ],
        ),
        child: TextField(
          style: const TextStyle(fontSize: textSize, color: Colors.white70, fontWeight: FontWeight.bold,),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: textSize, fontWeight: FontWeight.normal),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
          ),
        ),
      );
}
