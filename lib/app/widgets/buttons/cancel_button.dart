import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final double height;
  final Color borderColor; // Add a parameter for border color

  const CancelButton({super.key, 
    required this.onPressed,
    required this.text,
    this.fontSize = 14,
    this.height = 1.5,
    this.borderColor = AppColors.primaryPurpleColor1, // Default border color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: borderColor), // Use Border.all for border
          color: Colors.transparent, // Make background color transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: AppColors.primaryPurpleColor1, // Consider changing text color if needed
                fontFamily: 'Montserrat',
                height: height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
