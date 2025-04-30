import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class SpanTextSmall extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const SpanTextSmall({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.primaryGrayColor1,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Montserrat',
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
