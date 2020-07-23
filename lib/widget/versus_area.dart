import 'package:flutter/material.dart';

class VersusArea extends StatelessWidget {
  const VersusArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'V.S.',
      ),
    );
  }
}
