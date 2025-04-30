import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/utils/string_extensions.dart';

class HeaderTextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const HeaderTextTitle({
    super.key,
    required this.text,
    this.fontSize = 32.0,
    this.fontWeight = FontWeight.bold,
    this.color = AppColors.primaryGrayColor1,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      StringUtils.capitalize(text),
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
