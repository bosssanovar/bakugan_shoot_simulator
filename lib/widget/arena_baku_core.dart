import 'dart:math';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';

import 'painter/baku_core_paint.dart';

class ArenaBakuCore extends StatelessWidget {
  const ArenaBakuCore({
    Key key,
    this.position,
    this.bloc,
  }) : super(key: key);

  final TeamPosition position;
  final MainBloc bloc;

  @override
  Widget build(BuildContext context) {
    return bloc.isSuccessShoot(position)
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              buildBakuCore(),
              buildParameters(context),
            ],
          )
        : Container();
  }

  Widget buildBakuCore() {
    return CustomPaint(
      painter: _ArenaBakuCorePainter(),
      child: Container(),
    );
  }

  Widget buildParameters(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${_getBattlePointText(position)}',
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          '${_getShotDamageRateText(position)}',
          style: Theme
              .of(context)
              .textTheme
              .headline,
        ),
        Text(
          '${_getShotTypeText(position)}',
          style: Theme
              .of(context)
              .textTheme
              .headline,
        ),
      ],
    );
  }

  String _getBattlePointText(TeamPosition position) {
    if (!bloc.isShotBakugan()) {
      return '';
    }
    if (!bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'BP : ${bloc.getShotBakuganBattlePoint(position)}';
  }

  String _getShotDamageRateText(TeamPosition position) {
    if (!bloc.isShotBakugan()) {
      return '';
    }
    if (!bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'DR : ${bloc.getShotBakuganDamageRate(position)}';
  }

  String _getShotTypeText(TeamPosition position) {
    if (!bloc.isShotBakugan()) {
      return '';
    }
    if (!bloc.isSuccessShoot(position)) {
      return '-';
    }
    final sb = StringBuffer();
    for(final type in bloc.getShotBakuCoreType(position)){
      sb.write('${type.text}, ');
    }
    return sb.toString();
  }
}


class _ArenaBakuCorePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    paintArenaBakuCore(canvas, size, const Point(0, 0), 90);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
