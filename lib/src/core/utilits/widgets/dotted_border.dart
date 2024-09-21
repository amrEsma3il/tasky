import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double borderRadius; // Added borderRadius

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.borderRadius, // Accept borderRadius
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius), // Use borderRadius here
      ),
    );

    double dashWidth = strokeWidth; // Dash length
    double dashSpace = gap; // Space between dashes
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashWidth;
        canvas.drawPath(
          pathMetric.extractPath(distance, nextDistance),
          paint,
        );
        distance = nextDistance + dashSpace;
      }
      distance = 0.0; // Reset for next path metric
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double strokeWidth;
  final double gap;
  final double borderRadius; // Add borderRadius parameter

  const DottedBorderContainer({
    super.key,
    required this.child,
    this.borderColor = Colors.black,
    this.strokeWidth = 2.0,
    this.gap = 4.0,
    this.borderRadius = 8.0, // Default borderRadius value
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: borderColor,
        strokeWidth: strokeWidth,
        gap: gap,
        borderRadius: borderRadius, // Pass borderRadius to painter
      ),
      child: child,
    );
  }
}
