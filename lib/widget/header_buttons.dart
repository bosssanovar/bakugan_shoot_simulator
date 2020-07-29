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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isTeamBakuCoreFull(TeamPosition.left)
                ? Colors.blueGrey
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
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isSuccessShoot(TeamPosition.left)
                ? Colors.blueGrey
                : Colors.white12,
            onPressed: !widget.bloc.isSuccessShoot(TeamPosition.left)
                ? null
                : () {
                      widget.onUpdate(() {
                        widget.bloc.getOneMoreCore(TeamPosition.left);
                      });
                  },
            tooltip: 'add left',
            child: Icon(Icons.plus_one),
            foregroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.left)
                ? null
                : Colors.white30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isShotBakugan()
                ? Colors.blueGrey
                : Colors.white12,
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
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.right)
                ? Colors.blueGrey
                : Colors.white12,
            onPressed: !widget.bloc.isSuccessShoot(TeamPosition.right)
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.getOneMoreCore(TeamPosition.right);
              });
            },
            tooltip: 'add right',
            child: Icon(Icons.plus_one),
            foregroundColor:
            widget.bloc.isSuccessShoot(TeamPosition.right)
                ? null
                : Colors.white30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isTeamBakuCoreFull(TeamPosition.right)
                ? Colors.blueGrey
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
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}