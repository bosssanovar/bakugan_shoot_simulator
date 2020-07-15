enum BakuCoreType{
  Shield,
  MagicShield,
  Attack,
  SuperAttack,
  Special
}

extension BakuCoreTypeEx on BakuCoreType{
  String get text {
    switch(this){
      case BakuCoreType.Shield:
        return 'Shield';
      case BakuCoreType.MagicShield:
        return 'MagicShield';
      case BakuCoreType.Attack:
        return 'Attack';
      case BakuCoreType.SuperAttack:
        return 'SuperAttack';
      case BakuCoreType.Special:
        return 'Special';
    }
  }
}