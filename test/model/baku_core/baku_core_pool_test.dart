import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_lineup/baku_core_lineup.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_pool.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getRandom', () async {
    var list = BakuCoreLineupTestDummy();
    var bakuCores = BakuCorePool(list);
    final firstCore = bakuCores.getRandom();

    var counter = 0;
    final n = 500;
    for (int i = 0; i < n; i++) {
      final core = bakuCores.getRandom();

      expect(core.battlePoint <= 5, true);
      expect(core.damageRate <= 50, true);
      expect(core.battlePoint >= 1, true);
      expect(core.damageRate >= 10, true);

      if(firstCore.equal(core)){
        counter++;
      }
    }
    expect(counter <= ((n / list.getBakuCoreList().length) * 1.5), true);
    expect(counter >= ((n / list.getBakuCoreList().length) * 0.5), true);

  });
}

class BakuCoreLineupTestDummy implements BakuCoreLineup {
  @override
  List<BakuCore> getBakuCoreList() {
    return [
      BakuCore(1, 10, BakuCoreType.Attack),
      BakuCore(2, 20, BakuCoreType.Attack),
      BakuCore(3, 30, BakuCoreType.Attack),
      BakuCore(4, 40, BakuCoreType.Attack),
      BakuCore(5, 50, BakuCoreType.Attack)
    ];
  }
}