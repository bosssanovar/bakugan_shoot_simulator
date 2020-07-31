enum BakuCoreType{
  shield,
  magicShield,
  attack,
  superAttack,
  special,
  failed,
  none,
}

extension BakuCoreTypeEx on BakuCoreType{
  String get text {
    switch (this) {
      case BakuCoreType.shield:
        return 'Shield';
      case BakuCoreType.magicShield:
        return 'Magic Shield';
      case BakuCoreType.attack:
        return 'Attack';
      case BakuCoreType.superAttack:
        return 'Super Attack';
      case BakuCoreType.special:
        return 'Special';
      case BakuCoreType.failed:
        return '';
      case BakuCoreType.none:
        return '';
      default:
        throw Error();
    }
  }

  String get shotText {
    switch (this) {
      case BakuCoreType.shield:
        return 'S';
      case BakuCoreType.magicShield:
        return 'MS';
      case BakuCoreType.attack:
        return 'A';
      case BakuCoreType.superAttack:
        return 'SA';
      case BakuCoreType.special:
        return 'Sp';
      case BakuCoreType.failed:
        return '';
      case BakuCoreType.none:
        return '';
      default:
        throw Error();
    }
  }
}