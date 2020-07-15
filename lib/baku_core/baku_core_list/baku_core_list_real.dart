import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';
import 'baku_core_list.dart';

class BakuCoreListReal implements BakuCoreList {
  @override
  List<BakuCore> getBakuCoreList() {
    var ret = List<BakuCore>();
    for(int bp = -200; bp <= 650; bp+=50){
      for(int dr = -1; dr <= 6; dr++){
        ret.add(BakuCore(bp, dr, BakuCoreType.Attack));
        ret.add(BakuCore(bp, dr, BakuCoreType.SuperAttack));
        ret.add(BakuCore(bp, dr, BakuCoreType.Shield));
        ret.add(BakuCore(bp, dr, BakuCoreType.MagicShield));
        ret.add(BakuCore(bp, dr, BakuCoreType.Special));
      }
    }
    return ret;
  }

}