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
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isShotBakugan()
                ? Colors.lightBlueAccent
                : Colors.grey,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
                    widget.onUpdate(() {
                      //widget.bloc.reShootBakugan(TeamPosition.left);
                    });
                  },
            tooltip: 'clear left',
            child: Icon(Icons.delete),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor: widget.bloc.isShotBakugan()
                ? Colors.lightBlueAccent
                : Colors.grey,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
                      widget.onUpdate(() {
                        widget.bloc.getOneMoreCore(TeamPosition.left);
                      });
                  },
            tooltip: 'add left',
            child: Icon(Icons.plus_one),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isShotBakugan() ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.swapBakuCores();
              });
            },
            tooltip: 'swap',
            child: Icon(Icons.swap_horiz),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isShotBakugan() ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.getOneMoreCore(TeamPosition.right);
              });
            },
            tooltip: 'add right',
            child: Icon(Icons.plus_one),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.bloc.isShotBakugan() ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
              widget.onUpdate(() {
                //widget.bloc.reShootBakugan(TeamPosition.right);
              });
            },
            tooltip: 'shoot right',
            child: Icon(Icons.delete),
          ),
        ),
      ],
    );
  }
}