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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: position == TeamPosition.left
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
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
    return '${bloc.getShotBakuCoreType(position).text}';
  }
}
