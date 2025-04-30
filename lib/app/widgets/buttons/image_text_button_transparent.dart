import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class ImageTextButtonTransparent extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;
  final bool? color;

  const ImageTextButtonTransparent(
      {super.key, required this.text,
      required this.imagePath,
      required this.onPressed,
      this.color = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: color! ? AppColors.primaryGrayColor1 : Colors.transparent, // Use the color you desire (e.g., #999)
            width: 1.0, // The width of the border
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 8.0), // Gap between image and text
            Text(
              text,
              style: TextStyle(color:  color! ? AppColors.primaryGrayColor1 : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
