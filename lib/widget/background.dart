import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildWallpaper(),
       // buildButtonsBackground()
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
    return CustomPaint(
      painter: _MyPainter(),
      child: Container(
        height: 50,
      ),
    );
  }
}

class _MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    // header buttons area
    paint = new Paint()
      ..color = Colors.teal
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var path = Path();
    path.moveTo(size.width / 3, size.height / 5 * 3);
    path.lineTo(size.width / 3, size.height / 5 * 4);
    path.lineTo(size.width / 3 * 2, size.height / 5 * 4);
    path.lineTo(size.width / 3 * 2, size.height / 5 * 3);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}