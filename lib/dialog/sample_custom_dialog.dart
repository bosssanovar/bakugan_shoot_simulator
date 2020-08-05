import 'package:flutter/material.dart';

import 'modal_overlay.dart';

class sampleCustomDialog {
  sampleCustomDialog(this.context) : super();

  BuildContext context;

  void showCustomDialog() {
    Navigator.push(
      context,
      ModalOverlay(
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
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
                            child: Text('+100'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ))
              ],
            ),

            /*
               * OKボタン
               */
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                FlatButton(
                  color: Colors.grey,
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onPressed: hideCustomDialog,
                ),
                const SizedBox(
                  width: 20,
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "OK",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onPressed: hideCustomDialog,
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
