import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class TransparentTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final VoidCallback onPressed;
  final bool isUnderline;

  const TransparentTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.primaryPurpleColor1,
    this.textAlign = TextAlign.center,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: isUnderline
                ? TextStyle(
                    shadows: [
                      Shadow(
                        color:
                            color, // Use the specified text color for the shadow to match the underline effect
                        offset: const Offset(0,
                            -2), // Adjusts the space between the text and the underline
                      )
                    ],
                    fontWeight: fontWeight,
                    color: Colors
                        .transparent, // Makes text color transparent to only show the underline
                    decoration: TextDecoration.underline,
                    decorationColor:
                        color, // Use the specified text color for the underline to maintain consistency
                    decorationThickness:
                        2, // Adjust the thickness of the underline as needed
                    decorationStyle: TextDecorationStyle
                        .solid, // Choose the style (solid, dashed, etc.) as required
                  )
                : TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Montserrat',
                    fontWeight: fontWeight,
                    color: color,
                  ),
            textAlign: textAlign,
          ),
          // Additional widgets can be added here if needed
        ],
      ),
    );
  }
}
