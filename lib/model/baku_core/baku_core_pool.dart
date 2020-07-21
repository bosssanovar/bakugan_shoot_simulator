import 'dart:math';

import 'baku_core.dart';
import 'baku_core_lineup/baku_core_lineup.dart';

class BakuCorePool {

  BakuCorePool(this._bakuCoreList);

  final BakuCoreLineup _bakuCoreList;

  BakuCore getRandom() {
    final rng = Random();
    return _bakuCoreList
        .getBakuCoreList()[rng.nextInt(_bakuCoreList.getBakuCoreList().length)];
  }
}
