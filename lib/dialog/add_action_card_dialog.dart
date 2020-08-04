import 'package:flutter/material.dart';

import 'modal_overlay.dart';

class AddActionCardDialog {
  BuildContext context;

  AddActionCardDialog(this.context) : super();

  /*
   * 表示
   */
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
                Center(
                  child: Container(width: 100, height: 100, color: Colors.red),
                ),
                Container(
                    height: 200.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*
                             * タイトル
                             */
                          Text(
                            "カスタムダイアログ",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              locale: Locale("ja", "JP"),
                            ),
                          ),

                          /*
                             * メッセージ
                             */
                          Text(
                            "こんな感じでダイアログが出せるよ",
                            style: TextStyle(
                              fontSize: 16.0,
                              locale: Locale("ja", "JP"),
                            ),
                          ),
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
                  color: Colors.blue,
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      locale: Locale("ja", "JP"),
                    ),
                  ),
                  onPressed: () {
                    hideCustomDialog();
                  },
                ),
                SizedBox(
                  width: 80.0,
                )
              ],
            ),
          ],
        )),
        isAndroidBackEnable: false,
      ),
    );
  }


  /*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }
}