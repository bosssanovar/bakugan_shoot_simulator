import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderButtons extends StatefulWidget {
  const HeaderButtons({
    Key key,
    this.bloc,
    this.onUpdate,
  }) : super(key: key);

  @override
  _HeaderButtonsState createState() => _HeaderButtonsState();

  final MainBloc bloc;
  final Function(Function) onUpdate;
}

class _HeaderButtonsState extends State<HeaderButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isTeamBakuCoreFull(TeamPosition.left)
                ? null
                : Colors.white12,
            onPressed: !widget.bloc.isTeamBakuCoreFull(TeamPosition.left)
                ? null
                : () {
                    widget.onUpdate(() {
                      widget.bloc.clearTeamBakuCores(TeamPosition.left);
                    });
                  },
            tooltip: 'clear left',
            child: Icon(Icons.delete),
            foregroundColor: widget.bloc.isTeamBakuCoreFull(TeamPosition.left)
                ? null
                : Colors.white30,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isSuccessShoot(TeamPosition.left)
                ? null
                : Colors.white12,
            onPressed: !widget.bloc.isSuccessShoot(TeamPosition.left)
                ? null
                : () {
                      widget.onUpdate(() {
                      widget.bloc.shootToGetOneMoreCore(TeamPosition.left);
                    });
                  },
            tooltip: 'add left',
            child: Icon(Icons.plus_one),
            foregroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.left)
                ? null
                : Colors.white30,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isShotBakugan() ? null : Colors.white12,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.swapBakuCores();
              });
            },
            tooltip: 'swap',
            child: Icon(Icons.swap_horiz),
            foregroundColor:
            widget.bloc.isShotBakugan()
                ? null
                : Colors.white30,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.right)
                ? null
                : Colors.white12,
            onPressed: !widget.bloc.isSuccessShoot(TeamPosition.right)
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.shootToGetOneMoreCore(TeamPosition.right);
              });
            },
            tooltip: 'add right',
            child: Icon(Icons.plus_one),
            foregroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.right)
                ? null
                : Colors.white30,
          ),
          FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isTeamBakuCoreFull(TeamPosition.right)
                ? null
                : Colors.white12,
            onPressed: !widget.bloc.isTeamBakuCoreFull(TeamPosition.right)
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.clearTeamBakuCores(TeamPosition.right);
              });
            },
            tooltip: 'clear right',
            child: Icon(Icons.delete),
            foregroundColor:
            widget.bloc.isTeamBakuCoreFull(TeamPosition.right)
                ? null
                : Colors.white30,
          ),
        ],
      ),
    );
  }
}