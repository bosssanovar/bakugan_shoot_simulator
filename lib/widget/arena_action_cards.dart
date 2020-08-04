import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dialog/add_action_card_dialog.dart';

class ArenaActionCards extends StatelessWidget {
  const ArenaActionCards({
    @required this.bloc, @required this.position});

  final MainBloc bloc;
  final TeamPosition position;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        position == TeamPosition.left
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _buildAddButton(context),
              )
            : Container(),
        _buildComputedParam(context),
        position == TeamPosition.right
            ? Padding(
          padding: const EdgeInsets.only(left: 15),
          child: _buildAddButton(context),
              )
            : Container(),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AddActionCardDialog(context).showCustomDialog();
      },
      child: CustomPaint(
        painter: _ActionCardsButtonPainter(),
        child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            child: Text(
              '+',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
            )),
      ),
    );
  }

  GestureDetector _buildComputedParam(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: _ActionCardsPainter(),
        child: Container(
          height: 70,
          width: 120,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                left: 0,
                width: 130,
                height: 30,
                child: Text(
                  'BP : 9999',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 0,
                width: 80,
                height: 30,
                child: Text(
                  'DR : 99',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline,
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
    const width = 65;

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

    const height = 30;
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
