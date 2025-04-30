import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWithNoTextButton extends StatefulWidget {
  final String imagePath; // Path to the image file
  final double imageSize;
  final VoidCallback onPressed;

  const ImageWithNoTextButton({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    this.imageSize = 24.0,
  }) : super(key: key);

  @override
  _ImageWithNoTextButtonState createState() => _ImageWithNoTextButtonState();
}

class _ImageWithNoTextButtonState extends State<ImageWithNoTextButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (widget.imagePath.endsWith('.svg')) {
      // If the image path ends with '.svg', use SvgPicture.asset
      imageWidget = SvgPicture.asset(
        widget.imagePath,
        width: widget.imageSize,
        height: widget.imageSize,
      );
    } else {
      // For other image types (e.g., PNG or JPEG), use the Image widget
      imageWidget = Image.asset(
        widget.imagePath,
        width: widget.imageSize,
        height: widget.imageSize,
      );
    }

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: _isPressed ? Colors.grey : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget,
            // Add additional widgets here if needed
          ],
        ),
      ),
    );
  }
}

