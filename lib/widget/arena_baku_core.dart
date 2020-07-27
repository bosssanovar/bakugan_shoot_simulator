import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';

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
    return Stack(
    alignment: Alignment.center,
      children: <Widget>[
        buildBakuCore(),
        buildParameters(context),
      ],
    );
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
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotDamageRateText(position)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotTypeText(position)}',
          style: Theme.of(context).textTheme.display1,
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
    return '${bloc
        .getShotBakuCoreType(position)
        .text}';
  }
}


class _ArenaBakuCorePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // footer buttons area
    var paint = Paint()..color = Colors.white;
    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);

    paint = Paint()..color = Colors.orange;
    path = Path()
      ..moveTo(size.width / 2 - 50, size.height / 2 - 77)
      ..lineTo(size.width / 2 - 90, size.height / 2)
      ..lineTo(size.width / 2 - 50, size.height / 2 + 77)
      ..lineTo(size.width / 2 + 50, size.height / 2 + 77)
      ..lineTo(size.width / 2 + 90, size.height / 2)
      ..lineTo(size.width / 2 + 50, size.height / 2 - 77)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
