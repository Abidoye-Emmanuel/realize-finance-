import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class PurpleGradientButtonValidation extends StatelessWidget {
  final bool isValid;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;
  final bool isLoading;

  const PurpleGradientButtonValidation({super.key, 
    required this.isValid,
    required this.onPressed,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.white,
    this.height = 1.5,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isValid && !isLoading ? onPressed : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primaryPurpleColor1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize
              .min, // Ensures the Row takes the minimum required space
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontFamily: 'Montserrat',
                height: height,
              ),
            ),
            if (isLoading)
              const Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 16, // Adjust as needed for spacing
                    height: 16, // Adjust as needed for sizing
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
