import 'dart:math';

import 'package:flutter/material.dart';

void paintArenaBakuCore(Canvas canvas, Size size, Point origin, int radius) {
  _paintBakuCoreBase(canvas, size, const Point(0, 0), radius);
  _paintDamageRateArea(canvas, size, const Point(0, 0), radius);
  _paintBattlePointArea(canvas, size, const Point(0, 0), radius);
  _paintBakuCoreBorder(canvas, size, const Point(0, 0), radius, 5);
}

void paintTeamBakuCore(Canvas canvas, Size size, Point origin, int radius) {
  _paintBakuCoreBase(canvas, size, const Point(0, 0), radius);
  _paintTeamBakuCoreDamageRateArea(canvas, size, const Point(0, 0), radius);
  _paintBakuCoreBorder(canvas, size, const Point(0, 0), radius, 3);
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

void _paintDamageRateArea(Canvas canvas, Size size, Point origin, int radius) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()..color = const Color.fromARGB(0x99, 0xbb, 0xa7, 0x00);
  final path = Path()
    ..moveTo(x0 - radius / 2, y0 - radius / 2 * sqrt(3))
    ..lineTo(x0 - radius * 5 / 6, y0 - radius / 6 * sqrt(3))
    ..lineTo(x0 + radius * 5 / 6, y0 - radius / 6 * sqrt(3))
    ..lineTo(x0 + radius / 2, y0 - radius / 2 * sqrt(3))
    ..close();
  canvas.drawPath(path, paint);
}

void _paintTeamBakuCoreDamageRateArea(Canvas canvas, Size size, Point origin,
    int radius) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()
    ..color = const Color.fromARGB(0x99, 0xbb, 0xa7, 0x00);
  final path = Path()
    ..moveTo(x0 - radius * 5 / 6, y0 - radius / 6 * sqrt(3))
    ..lineTo(x0 + radius * 5 / 6, y0 - radius / 6 * sqrt(3))..lineTo(
        x0 + radius, y0)..lineTo(
        x0 + radius * 7 / 8, y0 + radius / 6 * sqrt(3))..lineTo(
        x0 - radius * 7 / 8, y0 + radius / 6 * sqrt(3))..lineTo(x0 - radius, y0)
    ..close();
  canvas.drawPath(path, paint);
}

void _paintBattlePointArea(Canvas canvas, Size size, Point origin, int radius) {
  final x0 = size.width / 2 + origin.x;
  final y0 = size.height / 2 + origin.y;

  final paint = Paint()
    ..color = const Color.fromARGB(0x99, 0xB2, 0x22, 0x22);
  final path = Path()
    ..moveTo(x0 - radius / 2, y0 + radius / 2 * sqrt(3))
    ..lineTo(x0 - radius * 5 / 6, y0 + radius / 6 * sqrt(3))..lineTo(
        x0 + radius * 5 / 6, y0 + radius / 6 * sqrt(3))
    ..lineTo(x0 + radius / 2, y0 + radius / 2 * sqrt(3))
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
