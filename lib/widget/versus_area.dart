import 'dart:math';

import 'package:bakugan_shoot_simulator/widget/painter/baku_core_pattern_paint.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class VersusArea extends StatelessWidget {
  const VersusArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: <Widget>[
            _buildBackground(),
            Center(
              child: BorderedText(
                strokeWidth: 1,
                strokeColor: Colors.black,
                child: const Text('V.S.'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Center(
      child: CustomPaint(
        painter: _VersusBackgroundPainter(),
        child: Container(),
      ),
    );
  }
}

class _VersusBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintBakuCorePattern(canvas, size, const Point(0, 0), 20,
        const Color.fromARGB(0xff, 0xaa, 0x30, 0x30));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
