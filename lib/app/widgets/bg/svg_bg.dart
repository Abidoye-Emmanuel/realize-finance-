import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBackgroundContainer extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final Widget child;
  final BorderRadiusGeometry borderRadius;

  const SvgBackgroundContainer({super.key, 
    required this.width,
    required this.height,
    required this.imagePath,
    required this.child,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(),
            Positioned.fill(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
      );
    }
  }
}
