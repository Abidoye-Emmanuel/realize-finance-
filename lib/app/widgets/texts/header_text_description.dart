import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class HeaderTextDescription extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final double height;

  const HeaderTextDescription({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.primaryGrayColor1,
    this.textAlign = TextAlign.left,
    this.height = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Montserrat',
        height: height, // This sets the line height
      ),
      textAlign: textAlign,
    );
  }
}
