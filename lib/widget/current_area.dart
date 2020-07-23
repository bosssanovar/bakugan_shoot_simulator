import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentArea extends StatefulWidget {
  const CurrentArea({
    Key key,
    this.position = TeamPosition.left,
    this.bloc,
  }) : super(key: key);

  @override
  _CurrentAreaState createState() => _CurrentAreaState();

  final TeamPosition position;
  final MainBloc bloc;
}

class _CurrentAreaState extends State<CurrentArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: widget.position == TeamPosition.left
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${_getBattlePointText(widget.position)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotDamageRateText(widget.position)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotTypeText(widget.position)}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }

  String _getBattlePointText(TeamPosition position) {
    if (!widget.bloc.isShotBakugan()) {
      return '';
    }
    if (!widget.bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'BP : ${widget.bloc.getShotBakuganBattlePoint(position)}';
  }

  String _getShotDamageRateText(TeamPosition position) {
    if (!widget.bloc.isShotBakugan()) {
      return '';
    }
    if (!widget.bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'DR : ${widget.bloc.getShotBakuganDamageRate(position)}';
  }

  String _getShotTypeText(TeamPosition position) {
    if (!widget.bloc.isShotBakugan()) {
      return '';
    }
    if (!widget.bloc.isSuccessShoot(position)) {
      return '-';
    }
    return '${widget.bloc.getShotBakuCoreType(position).text}';
  }
}
