import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: () {
              widget.onUpdate(() {
                widget.bloc.shootBakugans();
              });
            },
            tooltip: 'shoot',
            child: Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}