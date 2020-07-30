import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/arena_action_cards.dart';
import 'package:bakugan_shoot_simulator/widget/arena_baku_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'arena_baku_cores.dart';

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
        _buildBakuCoresPosition(child: _buildBakuCores()),
        _buildActionCardsPosition(
            child: _buildActionCards()),
      ],
    );
  }

  Widget _buildBakuCores() {
    return ArenaBakuCores(
      bloc: widget.bloc,
      position: widget.position,
    );
  }

  Widget _buildActionCards() {
    return ArenaActionCards(
      bloc: widget.bloc,
      position: widget.position,
    );
  }

  Positioned _buildArenaBakuCorePosition({Widget child}) {
    return widget.position == TeamPosition.left
        ? Positioned(top: 20, right: 15, child: child)
        : Positioned(bottom: 20, left: 15, child: child);
  }

  Widget _buildBakuCoresPosition({Widget child}) {
    if (!widget.bloc.isSuccessShoot(widget.position)) {
      return Container();
    }
    return widget.position == TeamPosition.left
        ? Positioned(top: 30, left: 60, child: child)
        : Positioned(bottom: 30, right: 60, child: child);
  }

  Widget _buildActionCardsPosition({Widget child}) {
    if (!widget.bloc.isSuccessShoot(widget.position)) {
      return Container();
    }
    return widget.position == TeamPosition.left
        ? Positioned(bottom: 0, left: 0, child: child)
        : Positioned(top: 0, right: 0, child: child);
  }
}