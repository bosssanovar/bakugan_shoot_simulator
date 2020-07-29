import 'dart:math';

import 'package:flutter/material.dart';

void paintArenaBakuCore(Canvas canvas, Size size, Point origin, int radius) {
  _paintBakuCoreBase(canvas, size, const Point(0, 0), 100);
  _paintBakuCoreBorder(canvas, size, const Point(0, 0), 100, 10);
}

void _paintBakuCoreBase(Canvas canvas, Size size, Point origin, int radius) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()..color = Colors.grey;
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

void _paintBakuCoreBorder(
    Canvas canvas, Size size, Point origin, int radius, double width) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;
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
