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
    return GestureDetector(
      child: CustomPaint(
        painter: _ActionCardsPainter(),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'BP : ${bloc.getCurrentBakuCoresCount(position)}',
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                'DR : ${bloc.getCurrentBakuCoresCount(position)}',
                style: Theme.of(context).textTheme.headline,
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

    const height = 40;
    const width = 80;

    var paint = Paint()..color = const Color.fromARGB(0x99, 0xff, 0x00, 0x00);
    var path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)
      ..lineTo(x0 + width, y0 + height)
      ..lineTo(x0 + width, y0 - height)
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

