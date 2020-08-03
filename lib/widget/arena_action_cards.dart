import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArenaActionCards extends StatelessWidget {
  const ArenaActionCards({
    @required this.bloc, @required this.position});

  final MainBloc bloc;
  final TeamPosition position;

  @override
  Widget build(BuildContext context) {
    return Container();
    // TODO K.I : いったんマスク
//    return Row(
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.only(bottom: 20, right: 5),
//          child: CustomPaint(
//            painter: _ActionCardsButtonPainter(),
//            child: Container(
//                alignment: Alignment.center,
//                width: 40,
//                height: 50,
//                child: const Text('+BP')),
//          ),
//        ),
//        _buildComputedParam(context),
//        Padding(
//          padding: const EdgeInsets.only(top: 20, left: 5),
//          child: CustomPaint(
//            painter: _ActionCardsButtonPainter(),
//            child: Container(
//                alignment: Alignment.center,
//                width: 40,
//                height: 40,
//                child: const Text('+DR')),
//          ),
//        ),
//      ],
//    );
  }

  GestureDetector _buildComputedParam(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: _ActionCardsPainter(),
        child: Container(
          height: 60,
          width: 120,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 0,
                width: 90,
                height: 30,
                child: Center(
                  child: Text(
                    'BP : 9999',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 0,
                width: 70,
                height: 30,
                child: Center(
                  child: Text(
                    'DR : 99',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class _ActionCardsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    const height = 30;
    const width = 60;

    var paint = Paint()
      ..color = const Color.fromARGB(0x99, 0xff, 0x00, 0x00);
    var path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)
      ..lineTo(x0 + width, y0 + height)
      ..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ActionCardsButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    const height = 20;
    const width = 20;

    var paint = Paint()
      ..color = const Color.fromARGB(0x99, 0xff, 0x00, 0x00);
    var path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
