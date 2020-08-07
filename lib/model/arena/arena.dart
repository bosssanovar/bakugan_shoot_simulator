import 'package:bakugan_shoot_simulator/model/action_card/action_card.dart';
import 'package:bakugan_shoot_simulator/model/arena/team_arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_lineup/baku_core_lineup_real.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core_gacha/baku_core_pool.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';

class Arena {

  final _bakuCorePool = BakuCorePool(BakuCoreLineupMine());
  final _teams = <TeamPosition, TeamArena>{
    TeamPosition.left: TeamArena(),
    TeamPosition.right: TeamArena()
  };

  // baku core

  void shootBakgans() {
    _teams[TeamPosition.left].setBakuCore(_bakuCorePool.getRandom());
    _teams[TeamPosition.right].setBakuCore(_bakuCorePool.getRandom());
  }

  bool isShotBakugan() {
    return !(_teams[TeamPosition.left].isNoCore ||
        _teams[TeamPosition.right].isNoCore);
  }

  bool isShotSuccess(TeamPosition position) {
    if (!isShotBakugan()) {
      return false;
    }
    if (!_teams[position].isSuccess) {
      return false;
    }
    return true;
  }

  int getBattlePoint(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _teams[position].getTotalBattlePoint();
  }

  int getDamageRate(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _teams[position].getTotalDamageRate();
  }

  List<BakuCoreType> getBakuCoreTypes(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }

    return _teams[position].getBakuCoresType();
  }

  List<BakuCore> getBakuCores(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('$position player is failed shooting.');
    }
    return _teams[position].getBakuCores();
  }

  void reShootBakugan(TeamPosition position) {
    if (!isShotBakugan()) {
      throw StateError('Bakugan is not shot yet.');
    }
    _teams[position].setBakuCore(_bakuCorePool.getRandom());
  }

  void swapBakuCores() {
    if (!isShotBakugan()) {
      throw StateError('Bakugan is not shot yet.');
    }

    final temp = _teams[TeamPosition.right];
    _teams[TeamPosition.right] = _teams[TeamPosition.left];
    _teams[TeamPosition.left] = temp;
  }

  void shootToGetOneMoreBakuCore(TeamPosition position) {
    if (!isShotSuccess(position)) {
      throw StateError('on this side, not success.');
    }
    _teams[position].addBakuCore(_bakuCorePool.getRandom());
  }

  // action card
  void addCard(TeamPosition teamPosition,
      {int battlePoint = 0, int damageRate = 0}) {
    _teams[teamPosition]
        .addCard(battlePoint: battlePoint, damageRate: damageRate);
  }

  int getActionCardBattlePointTotal(TeamPosition teamPosition) {
    return _teams[teamPosition].getBattlePointTotal();
  }

  int getActionCardDamageRate(TeamPosition teamPosition) {
    return _teams[teamPosition].getDamageRateTotal();
  }

  void clearActionCard() {
    _teams.forEach((key, value) {
      value.clear();
    });
  }

  List<ActionCard> getActionCards(TeamPosition teamPosition) {
    return _teams[teamPosition].getActionCards();
  }
}
