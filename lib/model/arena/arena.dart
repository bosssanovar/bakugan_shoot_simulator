import 'package:bakugan_shoot_simulator/model/arena/team_arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_lineup/baku_core_lineup_real.dart';
import 'package:bakugan_shoot_simulator/model/baku_core_gacha/baku_core_pool.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';

class Arena {

  final _bakuCorePool = BakuCorePool(BakuCoreLineupMine());
  final _bakuCores = <TeamPosition, TeamArena>{
    TeamPosition.left: TeamArena(),
    TeamPosition.right: TeamArena()
  };

  void shootBakgans() {
    _bakuCores[TeamPosition.left].setBakuCore(_bakuCorePool.getRandom());
    _bakuCores[TeamPosition.right].setBakuCore(_bakuCorePool.getRandom());
  }

  bool isShotBakugan() {
    return !(_bakuCores[TeamPosition.left].isNoCore ||
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
    return _bakuCores[position].getTotalBattlePoint();
  }

  int getDamageRate(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].getTotalDamageRate();
  }

  List<BakuCoreType> getBakuCoreTypes(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    
    return _bakuCores[position].getBakuCoresType();
  }

  List<BakuCore> getBakuCores(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _bakuCores[position].getBakuCores();
  }

  void reShootBakugan(TeamPosition position) {
    if(!isShotBakugan()){
      throw StateError('Bakugan is not shot yet.');
    }
    _bakuCores[position].setBakuCore(_bakuCorePool.getRandom());
  }

  void swapBakuCores() {
    if(!isShotBakugan()){
      throw StateError('Bakugan is not shot yet.');
    }

    final temp = _bakuCores[TeamPosition.right];
    _bakuCores[TeamPosition.right] = _bakuCores[TeamPosition.left];
    _bakuCores[TeamPosition.left] = temp;
  }

  void shootToGetOneMoreBakuCore(TeamPosition position) {
    if(!isShotSuccess(position)){
      throw StateError('on this side, not success.');
    }
    _bakuCores[position].addBakuCore(_bakuCorePool.getRandom());
  }
}
