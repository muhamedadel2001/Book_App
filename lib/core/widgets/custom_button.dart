import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colorText,
      required this.colorBackGround,
      required this.text,
      required this.borderRadius, this.onPressed});
  final Color colorText;
  final Color colorBackGround;
  final String text;
  final BorderRadius borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: colorBackGround,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        child: Text(
          text,
          style: TextStyle(color: colorText, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
