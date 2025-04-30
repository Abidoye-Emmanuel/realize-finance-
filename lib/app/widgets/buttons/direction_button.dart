import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class DirectionButton extends StatelessWidget {
  final String svgImagePath;
  final String text;
  final VoidCallback onPressed;

  const DirectionButton({
    Key? key,
    required this.svgImagePath,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              color: AppColors.primaryGrayColor1, // Change text color
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            svgImagePath,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
