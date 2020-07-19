import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_lineup/baku_core_lineup_real.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_pool.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/no_baku_core.dart';
import 'package:bakugan_shoot_simulator/model/player/player_position.dart';

class Arena {
  final _bakuCorePool = BakuCorePool(BakuCorelineupMine());
  var _bakuCores = Map<PlayerPosition, BakuCore>();

  Arena() {
    _bakuCores = {
      PlayerPosition.Left: NoBakuCore(),
      PlayerPosition.Right: NoBakuCore()
    };
  }

  void shootBakgans() {
    _bakuCores[PlayerPosition.Left] = _bakuCorePool.getRandom();
    _bakuCores[PlayerPosition.Right] = _bakuCorePool.getRandom();
  }

  bool isShotBakugan() {
    return !(_bakuCores[PlayerPosition.Left].isNoCore &&
        _bakuCores[PlayerPosition.Right].isNoCore);
  }

  bool isShotSuccess(PlayerPosition position) {
    if (!isShotBakugan()) {
      return false;
    }
    if (!_bakuCores[position].isSuccess) {
      return false;
    }
    return true;
  }

  int getBattlePoint(PlayerPosition position) {
    if (!this.isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].battlePoint;
  }

  int getDamageRate(PlayerPosition position) {
    if (!this.isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].damageRate;
  }

  BakuCoreType getBakuCoreType(PlayerPosition position) {
    if (!this.isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].type;
  }

  BakuCore getBakuCore(PlayerPosition position) {
    if (!this.isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position];
  }
}
