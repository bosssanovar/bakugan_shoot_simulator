import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/arena_baku_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentArea extends StatefulWidget {
  const CurrentArea({
    Key key,
    this.position = TeamPosition.left,
    this.bloc,
  }) : super(key: key);

  final TeamPosition position;
  final MainBloc bloc;

  @override
  _CurrentAreaState createState() => _CurrentAreaState();
}

class _CurrentAreaState extends State<CurrentArea> {
  @override
  Widget build(BuildContext context) {
    return ArenaBakuCore(
      position: widget.position,
      bloc: widget.bloc,
    );
  }
}