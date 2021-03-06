import 'dart:math';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/painter/baku_core_pattern_paint.dart';
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
    return SizedBox(
      width: 150,
      height: 150,
      child: bloc.isSuccessShoot(position)
          ? Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _buildBakuCoreBackground(),
                _buildParameters(context),
              ],
            )
          : _buildBakuCoreShape(),
    );
  }

  Widget _buildBakuCoreBackground() {
    return CustomPaint(
      painter: _ArenaBakuCorePainter(),
      child: Container(),
    );
  }

  Widget _buildParameters(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '${_getShotDamageRateText(position)}',
          style: Theme.of(context).textTheme.headline5,
        ),
        _buildBakuCoreTypeParameter(context),

        Text(
            '${_getBattlePointText(position)}',
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
      ],
    );
  }

  Widget _buildBakuCoreTypeParameter(BuildContext context) {
    if (!bloc.isShotBakugan()) {
      return Container();
    }
    if (!bloc.isSuccessShoot(position)) {
      return Container();
    }

    final size = bloc.getShotBakuCoreType(position).length > 3 ? 30 : 50;

    final wl = <Widget>[];
    for (final type in bloc.getShotBakuCoreType(position)) {
      wl.add(SizedBox(
        width: size.toDouble(),
        child: type.icon,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: wl,
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

  Widget _buildBakuCoreShape() {
    return Stack(
      children: <Widget>[
        Center(
          child: CustomPaint(
            painter: _BakuCoreShapePainter(),
            child: Container(),
          ),
        ),
        const Center(child: Text('miss...')),
      ],
    );
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

class _BakuCoreShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintBakuCorePattern(canvas, size, const Point(0, 0), 90,
        const Color.fromARGB(0xff, 0x22, 0x22, 0x22));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
