import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String label;
  Function()? onPressed;
  Color? color;

  CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFFFBF69),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff36382E),
          ),
        ),
      ),
    );
  }
}
