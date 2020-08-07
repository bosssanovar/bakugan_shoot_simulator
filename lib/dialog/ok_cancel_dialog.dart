import 'package:bakugan_shoot_simulator/dialog/ok_cancel_dialog_contents.dart';
import 'package:flutter/material.dart';

import 'modal_overlay.dart';

class OkCancelDialog {
  OkCancelDialog(
    this.context, {
    @required this.contents,
  }) : super();

  BuildContext context;
  OkCancelDialogContents contents;

  void showCustomDialog() {
    Navigator.push(
      context,
      ModalOverlay(
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                contents.build(context),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onPressed: () {
                        contents.onCancel();
                        hideCustomDialog();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Text(
                        'OK',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onPressed: () {
                        contents.onOk();
                        hideCustomDialog();
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            )),
        isAndroidBackEnable: false,
      ),
    );
  }

  void hideCustomDialog() {
    Navigator.of(context).pop();
  }
}
