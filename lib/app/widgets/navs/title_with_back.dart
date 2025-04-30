import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/texts/header_text_description.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';


class TitleWithBack extends StatelessWidget {
  final String text;
  final double fontSize;

  const TitleWithBack({super.key, required this.text, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageWithNoTextButton(
          imagePath: 'assets/icons/back-icon.svg',
          onPressed: () {
            // Your button click logic here
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Center(
            child: HeaderTextDescription(
              text: text,
              height: 0,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
