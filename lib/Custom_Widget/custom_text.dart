import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? max;
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight,
      this.textAlign,
      this.max});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: max,
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
