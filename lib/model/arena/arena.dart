import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_lineup/baku_core_lineup_real.dart';
import 'package:bakugan_shoot_simulator/model/baku_core_gacha/baku_core_pool.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/no_baku_core.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';

class Arena {

  Arena() {
    _bakuCores = {
      TeamPosition.left: NoBakuCore(),
      TeamPosition.right: NoBakuCore()
    };
  }

  final _bakuCorePool = BakuCorePool(BakuCoreLineupMine());
  var _bakuCores = <TeamPosition, BakuCore>{};

  void shootBakgans() {
    _bakuCores[TeamPosition.left] = _bakuCorePool.getRandom();
    _bakuCores[TeamPosition.right] = _bakuCorePool.getRandom();
  }

  bool isShotBakugan() {
    return !(_bakuCores[TeamPosition.left].isNoCore &&
        _bakuCores[TeamPosition.right].isNoCore);
  }

  bool isShotSuccess(TeamPosition position) {
    if (!isShotBakugan()) {
      return false;
    }
    if (!_bakuCores[position].isSuccess) {
      return false;
    }
    return true;
  }

  int getBattlePoint(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].battlePoint;
  }

  int getDamageRate(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].damageRate;
  }

  BakuCoreType getBakuCoreType(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].type;
  }

  BakuCore getBakuCore(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position];
  }

  void reShootBakugan(TeamPosition position) {
    if(!isShotBakugan()){
      throw StateError('Bakugan is not shot yet.');
    }
    _bakuCores[position] = _bakuCorePool.getRandom();
  }

  void swapBakuCores() {
    if(!isShotBakugan()){
      throw StateError('Bakugan is not shot yet.');
    }

    final temp = _bakuCores[TeamPosition.right];
    _bakuCores[TeamPosition.right] = _bakuCores[TeamPosition.left];
    _bakuCores[TeamPosition.left] = temp;
  }
}
