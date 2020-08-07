import 'package:bakugan_shoot_simulator/model/action_card/action_card.dart';
import 'package:bakugan_shoot_simulator/model/action_card/action_cards.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_cores.dart';

class TeamArena {
  final BakuCores _bakuCores = BakuCores();
  final ActionCards _actionCards = ActionCards();

  // baku core

  bool get isNoCore => _bakuCores.isNoCore();

  bool get isSuccess =>
      !_bakuCores.isNoCore() && _bakuCores.isSuccessCurrentCore();

  void setBakuCore(BakuCore bakuCore) {
    _bakuCores
      ..clear()
      ..add(bakuCore);
  }

  void clearBakuCores() {
    _bakuCores.clear();
  }

  void addBakuCore(BakuCore bakuCore) {
    if(!bakuCore.isSuccess) {
      return;
    }
    _bakuCores.add(bakuCore);
  }

  void removeBakuCore(BakuCore bakuCore){
    _bakuCores.remove(bakuCore);
  }

  int getBakuCoreCount(){
    return _bakuCores.count;
  }

  int getTotalBattlePoint() {
    return _bakuCores.getTotalBattlePoint();
  }

  int getTotalDamageRate() {
    return _bakuCores.getTotalDamageRate();
  }

  List<BakuCoreType> getBakuCoresType() {
    return _bakuCores.getTypes();
  }

  List<BakuCore> getBakuCores() {
    return _bakuCores.getBakuCores();
  }

  // action card

  void addCard({int battlePoint = 0, int damageRate = 0}) {
    _actionCards.addCard(battlePoint: battlePoint, damageRate: damageRate);
  }

  int getBattlePointTotal() {
    return _actionCards.getBattlePointTotal();
  }

  int getDamageRateTotal() {
    return _actionCards.getDamageRateTotal();
  }

  void clear() {
    _actionCards.clear();
  }

  List<ActionCard> getActionCards() {
    return _actionCards.getCards();
  }
}