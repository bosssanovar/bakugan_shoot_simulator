import 'dart:math';
import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_list/baku_core_list.dart';

class BakuCores{

  final BakuCoreList _bakuCoreList;

  BakuCores(this._bakuCoreList);

  BakuCore getRandom(){
    var rng = new Random();
    return _bakuCoreList.getBakuCoreList()[rng.nextInt(_bakuCoreList.getBakuCoreList().length)];
  }
}