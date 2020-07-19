import 'dart:math';

import 'baku_core.dart';
import 'baku_core_lineup/baku_core_lineup.dart';

class BakuCorePool {
  final BakuCoreLineup _bakuCoreList;

  BakuCorePool(this._bakuCoreList);

  BakuCore getRandom() {
    var rng = new Random();
    return _bakuCoreList
        .getBakuCoreList()[rng.nextInt(_bakuCoreList.getBakuCoreList().length)];
  }
}
