import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class NavTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const NavTitle({super.key, required this.text, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    const double iconWidth = 32.0;

    return Row(
      children: [
        ImageWithNoTextButton(
          imagePath: 'assets/icons/profile.svg',
          imageSize: 32,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 8), // Add spacing between icon and text
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: iconWidth), // Add margin to the right of the text
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.primaryBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center, // Center text horizontally
                maxLines: 1, // Ensure the text doesn't wrap to the next line
                overflow: TextOverflow.ellipsis, // Handle overflow gracefully
              ),
            ),
          ),
        ),
      ],
    );
  }
}
