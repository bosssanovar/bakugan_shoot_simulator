import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderButtons extends StatefulWidget {
  HeaderButtons(
      {
        Key key,
        this.isShotBakugan = false,
        this.onPressSwap,
        this.onPressReshootLeft,
        this.onPressReshootRight,
      }) : super(key: key) {
    if(onPressSwap == null){
      throw ArgumentError();
    }
    if(onPressReshootLeft == null){
      throw ArgumentError();
    }
    if(onPressReshootRight == null){
      throw ArgumentError();
    }
  }

  @override
  _HeaderButtonsState createState() => _HeaderButtonsState();

  final bool isShotBakugan;
  final Function onPressSwap;
  final Function onPressReshootLeft;
  final Function onPressReshootRight;
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
            backgroundColor:
            widget.isShotBakugan ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.isShotBakugan
                ? null
                : () {
//                      setState(() {
//                        _bloc.reShootBakugan(PlayerPosition.Right);
//                      });
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
            widget.isShotBakugan ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.isShotBakugan
                ? null
                : () {
                    widget.onPressReshootLeft();
                  },
            tooltip: 'shoot left',
            child: Icon(Icons.repeat_one),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.isShotBakugan ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.isShotBakugan
                ? null
                : () {
             widget.onPressSwap();
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
            widget.isShotBakugan ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.isShotBakugan
                ? null
                : () {
                widget.onPressReshootRight();
            },
            tooltip: 'shoot right',
            child: Icon(Icons.repeat_one),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            disabledElevation: 0,
            backgroundColor:
            widget.isShotBakugan ? Colors.lightBlueAccent : Colors.grey,
            onPressed: !widget.isShotBakugan
                ? null
                : () {
//                      setState(() {
//                        _bloc.reShootBakugan(PlayerPosition.Right);
//                      });
            },
            tooltip: 'add right',
            child: Icon(Icons.plus_one),
          ),
        ),
      ],
    );
  }
}