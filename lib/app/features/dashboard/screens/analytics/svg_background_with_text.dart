import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/bg/svg_bg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class SvgBackgroundContainerWithText extends StatelessWidget {
  final String imagePath;
  final String text;
  final String itemImagePath;
  final VoidCallback onPress; // Callback for onPress action

  const SvgBackgroundContainerWithText({super.key, 
    required this.imagePath,
    required this.itemImagePath,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Assigning onPress callback to GestureDetector
      child: SvgBackgroundContainer(
        width: double.infinity,
        height: 200,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        imagePath: imagePath,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              itemImagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
