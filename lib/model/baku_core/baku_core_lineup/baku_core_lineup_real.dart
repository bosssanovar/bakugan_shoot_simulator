import '../baku_core.dart';
import '../baku_core_type.dart';
import 'baku_core_lineup.dart';

class BakuCoreLineupMine implements BakuCoreLineup {
  @override
  List<BakuCore> getBakuCoreList() {
    return [
      // 失敗の確率を個数で制御
      const BakuCore(0, 0, BakuCoreType.failed),
      const BakuCore(1, 1, BakuCoreType.failed),
      const BakuCore(2, 2, BakuCoreType.failed),
      const BakuCore(3, 3, BakuCoreType.failed),
      const BakuCore(4, 4, BakuCoreType.failed),
      const BakuCore(5, 5, BakuCoreType.failed),

      // Attack
      const BakuCore(0,2,BakuCoreType.attack),
      const BakuCore(0,3,BakuCoreType.attack),
      const BakuCore(150,2,BakuCoreType.attack),
      const BakuCore(0,-1,BakuCoreType.attack),
      const BakuCore(100,3,BakuCoreType.attack),
      const BakuCore(100,0,BakuCoreType.attack),

      // Super Attack
      const BakuCore(0,5,BakuCoreType.superAttack),
      const BakuCore(0,6,BakuCoreType.superAttack),
      const BakuCore(150,4,BakuCoreType.superAttack),
      const BakuCore(0,-1,BakuCoreType.superAttack),

      // Shield
      const BakuCore(100,0,BakuCoreType.shield),
      const BakuCore(150,0,BakuCoreType.shield),
      const BakuCore(200,0,BakuCoreType.shield),
      const BakuCore(300,0,BakuCoreType.shield),
      const BakuCore(-200,0,BakuCoreType.shield),
      const BakuCore(400,0,BakuCoreType.shield),
      const BakuCore(0,0,BakuCoreType.shield),

      // Magic Shield
      const BakuCore(600,0,BakuCoreType.magicShield),

      // Special
      const BakuCore(500,-1,BakuCoreType.special),
      const BakuCore(-100,4,BakuCoreType.special),
    ];
  }

}