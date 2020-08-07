import 'package:bakugan_shoot_simulator/model/action_card/action_card.dart';

class ActionCards {
  final _cards = <ActionCard>[];

  void addCard({int battlePoint = 0, int damageRate = 0}) {
    _cards.add(ActionCard(battlePoint: battlePoint, damageRate: damageRate));
  }

  int getBattlePointTotal() {
    var ret = 0;
    for (final card in _cards) {
      ret += card.battlePoint;
    }
    return ret;
  }

  int getDamageRateTotal() {
    var ret = 0;
    for (final card in _cards) {
      ret += card.damageRate;
    }
    return ret;
  }

  void clear() {
    _cards.clear();
  }

  List<ActionCard> getCards() {
    return _cards;
  }
}
