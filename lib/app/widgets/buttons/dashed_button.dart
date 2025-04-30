import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';

class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    this.dashWidth = 5.0,
    this.dashSpace = 5.0,
    this.color = AppColors.primaryGrayColor1,
    this.strokeWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var rect = Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2,
        size.width - strokeWidth, size.height - strokeWidth);
    var rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    var path = Path()..addRRect(rrect);
    var metric = path.computeMetrics().first;
    double distance = 0.0;

    while (distance < metric.length) {
      final end = math.min(distance + dashWidth, metric.length);
      final extractPath = metric.extractPath(distance, end);
      canvas.drawPath(extractPath, paint);
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedBorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DashedBorderButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
              child: Text(text,
                  style: const TextStyle(
                      color: AppColors.primaryPurpleColor1,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w400))),
        ),
      ),
    );
  }
}
