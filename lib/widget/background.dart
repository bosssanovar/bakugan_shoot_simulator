import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildWallpaper(),
//        buildButtonsBackground()
      ],
    );
  }

  Widget buildWallpaper() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/background.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat),
      ),
    );
  }

  Widget buildButtonsBackground() {
    return CustomPaint(painter: _MyPainter());
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
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(const Offset(0, 0), 100, stroke);
  }
}