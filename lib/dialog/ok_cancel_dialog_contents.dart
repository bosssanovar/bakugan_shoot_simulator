import 'package:flutter/material.dart';

abstract class OkCancelDialogContents {
  Widget build(BuildContext context);

  void onOk();

  void onCancel();
}
