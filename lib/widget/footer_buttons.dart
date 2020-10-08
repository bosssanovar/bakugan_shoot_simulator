import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterButtons extends StatefulWidget {
  const FooterButtons({
    Key key,
    this.bloc,
    this.onUpdate,
  }) : super(key: key);

  @override
  _FooterButtonsState createState() => _FooterButtonsState();

  final MainBloc bloc;
  final Function(Function) onUpdate;
}

class _FooterButtonsState extends State<FooterButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor:
                widget.bloc.isShotBakugan() ? null : Colors.white12,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
                    widget.onUpdate(() {
                      widget.bloc.reShootBakugan(TeamPosition.left);
                    });
                  },
            tooltip: 'left shoot',
            child: const Icon(Icons.repeat_one),
            foregroundColor:
                widget.bloc.isShotBakugan()
                ? null
                : Colors.white30,
          ),
          FloatingActionButton(
            onPressed: () {
              widget.onUpdate(() {
                widget.bloc.shootBakugans();
              });
            },
            tooltip: 'shoot',
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            backgroundColor: widget.bloc.isShotBakugan()
                ? null
                : Colors.white12,
            onPressed: !widget.bloc.isShotBakugan()
                ? null
                : () {
              widget.onUpdate(() {
                widget.bloc.reShootBakugan(TeamPosition.right);
              });
            },
            tooltip: 'right shoot',
            child: const Icon(Icons.repeat_one),
            foregroundColor:
            widget.bloc.isShotBakugan()
                ? null
                : Colors.white30,
          ),
        ],
      ),
    );
  }
}