import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';
import 'baku_core_list.dart';

class BakuCoreListReal implements BakuCoreList {
  @override
  List<BakuCore> getBakuCoreList() {
    return [
      BakuCore(0,0,BakuCoreType.Attack),
      BakuCore(100,1,BakuCoreType.Shield)
    ];
  }

}