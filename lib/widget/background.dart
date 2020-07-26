import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildWallpaper(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildHeaderButtonsBackground(),
            buildFooterButtonsBackground(),
          ],
        )
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

  Widget buildHeaderButtonsBackground() {
    return CustomPaint(
      painter: _HeaderButtonBackgroundPainter(),
      child: Container(
        height: 75,
      ),
    );
  }

  Widget buildFooterButtonsBackground() {
    return CustomPaint(
      painter: _FooterButtonBackgroundPainter(),
      child: Container(
        height: 75,
      ),
    );
  }
}

class _HeaderButtonBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // header buttons area
    final paint = Paint()..color = Colors.black;
    final path = Path()
      ..moveTo(size.width / 2 - 230, 0)
      ..lineTo(size.width / 2 - 180, size.height)
      ..lineTo(size.width / 2 + 180, size.height)
      ..lineTo(size.width / 2 + 230, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _FooterButtonBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // footer buttons area
    final paint = Paint()..color = Colors.black;
    final path = Path()
      ..moveTo(size.width / 2 - 180, 0)
      ..lineTo(size.width / 2 - 230, size.height)
      ..lineTo(size.width / 2 + 230, size.height)
      ..lineTo(size.width / 2 + 180, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}