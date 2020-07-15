import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';
import 'baku_core_list.dart';

class BakuCoreListReal implements BakuCoreList {
  @override
  List<BakuCore> getBakuCoreList() {
    return [
      // 失敗の確率を個数で制御
      BakuCore(0,0,BakuCoreType.Failed),
      BakuCore(1,1,BakuCoreType.Failed),
      BakuCore(2,2,BakuCoreType.Failed),

      // Attack
      BakuCore(0,2,BakuCoreType.Attack),
      BakuCore(0,3,BakuCoreType.Attack),
      BakuCore(150,2,BakuCoreType.Attack),
      BakuCore(0,-1,BakuCoreType.Attack),
      BakuCore(100,3,BakuCoreType.Attack),
      BakuCore(100,0,BakuCoreType.Attack),

      // Super Attack
      BakuCore(0,5,BakuCoreType.SuperAttack),
      BakuCore(0,6,BakuCoreType.SuperAttack),
      BakuCore(150,4,BakuCoreType.SuperAttack),
      BakuCore(0,-1,BakuCoreType.SuperAttack),

      // Shield
      BakuCore(100,0,BakuCoreType.Shield),
      BakuCore(150,0,BakuCoreType.Shield),
      BakuCore(200,0,BakuCoreType.Shield),
      BakuCore(300,0,BakuCoreType.Shield),
      BakuCore(-200,0,BakuCoreType.Shield),
      BakuCore(400,0,BakuCoreType.Shield),
      BakuCore(0,0,BakuCoreType.Shield),

      // Magic Shield
      BakuCore(600,0,BakuCoreType.MagicShield),

      // Special
      BakuCore(500,-1,BakuCoreType.Special),
      BakuCore(-100,4,BakuCoreType.Special),
    ];
  }

}