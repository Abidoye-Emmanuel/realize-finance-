import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class PurpleGradientButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;
  final TextAlign textAlign;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const PurpleGradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white,
    this.height = 1.5,
    this.textAlign = TextAlign.center,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primaryPurpleColor1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                fontFamily: 'Montserrat',
                height: height,
              ),
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}
