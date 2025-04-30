import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class TextWithImageButton extends StatelessWidget {
  final String imagePath; // Path to the image file
  final double imageSize;
  final double textSize;
  final String text;
  final Color borderColor;
  final Color textColor;
  final bool isReversed;
  final VoidCallback onPressed;
  final double spaceBetween;

  const TextWithImageButton(
      {Key? key,
      required this.imagePath,
      required this.onPressed,
      required this.text,
      this.borderColor = AppColors.primaryGrayColor1,
      this.isReversed = false,
      this.textColor = AppColors.primaryGrayColor1,
      this.imageSize = 24.0,
      this.textSize = 12.0,
      this.spaceBetween = 4.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imagePath.endsWith('.svg')) {
      // If the image path ends with '.svg', use SvgPicture.asset
      imageWidget = SvgPicture.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
      );
    } else {
      // For other image types (e.g., PNG or JPEG), use the Image widget
      imageWidget = Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: const EdgeInsets.fromLTRB(
          16.0,
          8.0,
          16.0,
          8.0,
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: isReversed
        //       ? [
        //           SpanTextSmall(
        //             text: text,
        //             fontSize: textSize,
        //             color: textColor,
        //           ),
        //           SizedBox(
        //             width: spaceBetween,
        //           ),
        //           imageWidget,

        //           // Add additional widgets here if needed
        //         ]
        //       : [
        //           imageWidget,
        //           SizedBox(
        //             width: spaceBetween,
        //           ),
        //           // Add additional widgets here if needed
        //           SpanTextSmall(
        //             text: text,
        //             fontSize: textSize,
        //             color: textColor,
        //           )
        //         ],
        // ),
      ),
    );
  }
}
