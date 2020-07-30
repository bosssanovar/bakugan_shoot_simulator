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
    return widget.bloc.isShotBakugan() ? _buildCurrentArea() : Container();
  }

  Stack _buildCurrentArea() {
    return Stack(
      children: <Widget>[
        _buildArenaBakuCorePosition(
          child: ArenaBakuCore(
            position: widget.position,
            bloc: widget.bloc,
          ),
        ),
        _buildBakuCoresPosition(
            child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        )),
        _buildActionCardsPosition(
            child: Container(
          width: 120,
          height: 80,
          color: Colors.blue,
        )),
      ],
    );
  }

  Positioned _buildArenaBakuCorePosition({Widget child}) {
    return widget.position == TeamPosition.left
        ? Positioned(top: 0, right: 5, child: child)
        : Positioned(bottom: 0, left: 5, child: child);
  }

  Positioned _buildBakuCoresPosition({Widget child}) {
    return widget.position == TeamPosition.left
        ? Positioned(top: 5, left: 50, child: child)
        : Positioned(bottom: 5, right: 50, child: child);
  }

  Positioned _buildActionCardsPosition({Widget child}) {
    return widget.position == TeamPosition.left
        ? Positioned(bottom: 25, left: 0, child: child)
        : Positioned(top: 25, right: 0, child: child);
  }
}