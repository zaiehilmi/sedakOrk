import 'package:flutter/material.dart';
import 'package:sedakork/util/custom_textstyle.dart';

class CustomTextButton extends StatelessWidget {
  String label;
  Function()? onPressed;
  Color? color;

  CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(
        label,
        style: CustomTextStyle.buttonText,
      ),
    );
  }
}
