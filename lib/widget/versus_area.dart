import 'package:flutter/material.dart';

class VersusArea extends StatelessWidget {
  const VersusArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              'V.S.',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Center(
        child: Container(
      color: Colors.black87,
      height: 50,
      width: 50,
    ));
  }
}
