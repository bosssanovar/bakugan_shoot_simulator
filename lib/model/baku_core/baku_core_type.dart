import 'package:flutter/material.dart';

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
    }
    throw Error();
  }

  String get shortText {
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
    }
    throw Error();
  }

  Color get color {
    switch (this) {
      case BakuCoreType.shield:
        return Colors.amber;
      case BakuCoreType.magicShield:
        return Colors.blue;
      case BakuCoreType.attack:
        return Colors.green;
      case BakuCoreType.superAttack:
        return Colors.red;
      case BakuCoreType.special:
        return Colors.black;
      case BakuCoreType.failed:
        return null;
      case BakuCoreType.none:
        return null;
    }
    throw Error();
  }

  Image get icon {
    switch (this) {
      case BakuCoreType.shield:
        return Image.asset('asset/baku_core_type/baku_core_shield.png');
      case BakuCoreType.magicShield:
        return Image.asset('asset/baku_core_type/baku_core_magic_shield.png');
      case BakuCoreType.attack:
        return Image.asset('asset/baku_core_type/baku_core_attack.png');
      case BakuCoreType.superAttack:
        return Image.asset('asset/baku_core_type/baku_core_super_attack.png');
      case BakuCoreType.special:
        return Image.asset('asset/baku_core_type/baku_core_special.png');
      case BakuCoreType.failed:
        return null;
      case BakuCoreType.none:
        return null;
    }
    throw Error();
  }
}