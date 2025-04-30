import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class PurpleOutlineButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;
  final TextAlign textAlign;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const PurpleOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.primaryPurpleColor1,
    this.height = 1.5,
    this.textAlign = TextAlign.center,
    this.padding = const EdgeInsets.symmetric(
        horizontal: 16.0, vertical: 8.0), // Changed here
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: color ?? AppColors.primaryPurpleColor1,
            width: 1.0,
          ),
        ),
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
            // const SizedBox(width: 10.0), // gap
            // You can add additional widgets here, if you have any icon or other content for the button
          ],
        ),
      ),
    );
  }
}
