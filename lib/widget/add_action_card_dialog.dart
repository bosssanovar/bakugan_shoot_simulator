import 'package:flutter/material.dart';

class AddActionCardDialog extends StatefulWidget {
  const AddActionCardDialog({
    @required this.addActionCard,
  });

  final Function(AddActionCardParameter) addActionCard;

  @override
  _AddActionCardDialogState createState() => _AddActionCardDialogState();
}

class _AddActionCardDialogState extends State<AddActionCardDialog> {
  int _battlePoint = 0;
  int _damageRate = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Play an action card."),
      content: Column(
        children: const <Widget>[
          Text('aaaaa'),
          Text('bbbbbb'),
          Text('bbbbbb'),
          Text('bbbbbb'),
          Text('bbbbbb'),
        ],
      ),
      actions: <Widget>[
        // ボタン領域
        FlatButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: const Text('Play'),
          onPressed: () {
            widget.addActionCard(
                AddActionCardParameter(_battlePoint, _damageRate));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class AddActionCardParameter {
  AddActionCardParameter(this.battlePoint, this.damageRate);

  final int battlePoint;
  final int damageRate;
}
