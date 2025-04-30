import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class SvgOutlinedTextButton extends StatelessWidget {
  final String text;
  final String svgPath;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;

  const SvgOutlinedTextButton({super.key, 
    required this.text,
    required this.svgPath,
    required this.onPressed,
    this.fontSize = 14.0, // Default font size
    this.color = AppColors.primaryPurpleColorLight5, // Default color

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: color), // Border
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(color: color, fontSize: fontSize),
            ),
            const SizedBox(width: 8.0), // Gap between image and text
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
