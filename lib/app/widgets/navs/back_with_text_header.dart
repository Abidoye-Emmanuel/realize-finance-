import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class BackWithTextHeader extends StatelessWidget {
  final String text;
  final String? icon;
  final VoidCallback? onPressed;

  const BackWithTextHeader({super.key, required this.text, this.icon = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageWithNoTextButton(
          imageSize: 28,
          imagePath:
              icon != null && icon != '' ? icon! : 'assets/icons/back-icon.svg',
          onPressed: () {
            // If onPressed is provided, use it, otherwise use Navigator.pop(context)
            if (onPressed != null) {
              onPressed!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColors.primaryPurpleColor1,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ],
    );
  }
}
