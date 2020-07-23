import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomPaint(painter: _MyPainter()),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas
      ..drawCircle(const Offset(0, 100), 30, stroke)
      ..drawCircle(const Offset(0, 200), 30, stroke)
      ..drawCircle(const Offset(0, 300), 30, stroke)
      ..drawCircle(const Offset(0, 400), 30, stroke);
  }
}
