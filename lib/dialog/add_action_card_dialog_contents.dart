import 'package:bakugan_shoot_simulator/dialog/ok_cancel_dialog_contents.dart';
import 'package:flutter/material.dart';

class AddActionCardDialogContents implements OkCancelDialogContents {
  @override
  Widget build(BuildContext context) {
    return AddActionCardDialogWidget();
  }

  @override
  void onCancel() {}

  @override
  void onOk() {}
}

class AddActionCardDialogWidget extends StatefulWidget {
  @override
  _AddActionCardDialogWidgetState createState() =>
      _AddActionCardDialogWidgetState();
}

class _AddActionCardDialogWidgetState extends State<AddActionCardDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        Container(
            color: Colors.grey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BP : ',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Text(
                    'こんな感じでダイアログが出せるよ',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  FlatButton(
                    child: const Text('+100'),
                    onPressed: () {},
                  )
                ],
              ),
            ))
      ],
    );
  }
}
