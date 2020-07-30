import 'dart:math';

import 'package:flutter/material.dart';

void paintBakuCorePattern(
    Canvas canvas, Size size, Point origin, int radius, Color color) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()..color = color;
  final path = Path()
    ..moveTo(x0 - radius / 2, y0 - radius / 2 * sqrt(3))
    ..lineTo(x0 - radius, y0)
    ..lineTo(x0 - radius / 2, y0 + radius / 2 * sqrt(3))
    ..lineTo(x0 + radius / 2, y0 + radius / 2 * sqrt(3))
    ..lineTo(x0 + radius, y0)
    ..lineTo(x0 + radius / 2, y0 - radius / 2 * sqrt(3))
    ..close();
  canvas.drawPath(path, paint);
}
