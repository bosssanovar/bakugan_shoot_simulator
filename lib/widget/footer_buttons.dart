import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterButtons extends StatefulWidget {
  FooterButtons(
      {
        Key key,
        this.onShootBakugans,
      }) : super(key: key) {
    if(onShootBakugans == null){
      throw ArgumentError();
    }
  }

  @override
  _FooterButtonsState createState() => _FooterButtonsState();

  final Function onShootBakugans;
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
              widget.onShootBakugans();
            },
            tooltip: 'shoot',
            child: Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}