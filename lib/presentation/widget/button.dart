import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  Function()? onPressed;
  Color? color;

  Button({
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
      // margin: EdgeInsets.only(left: 118, top: 592),
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
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Color(0xff36382E),
          ),
        ),
      ),
    );
  }
}
