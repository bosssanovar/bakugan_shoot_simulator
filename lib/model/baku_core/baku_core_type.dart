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
    switch(this){
      case BakuCoreType.shield:
        return 'Shield';
      case BakuCoreType.magicShield:
        return 'MagicShield';
      case BakuCoreType.attack:
        return 'Attack';
      case BakuCoreType.superAttack:
        return 'SuperAttack';
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
}