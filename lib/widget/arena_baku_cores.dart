import 'dart:math';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/painter/baku_core_pattern_paint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArenaBakuCores extends StatelessWidget {
  const ArenaBakuCores({
    @required this.bloc,
    @required this.position,
  });

  final MainBloc bloc;
  final TeamPosition position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: _BakCoresPainter(),
        child: Container(
          child: Text(
            '${bloc.getCurrentBakuCoresCount(position)}',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class _BakCoresPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintBakuCorePattern(canvas, size, const Point(0, 0), 23, Colors.grey);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

