import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';

class BakuCore{
  final int battlePoint;
  final int damageRate;
  final BakuCoreType type;

  bool get isNoCore => false;

  bool get canAddTeam => type.canAddTeam ;

  const BakuCore(this.battlePoint, this.damageRate, this.type);

  equal(BakuCore target){
    if(this.battlePoint != target.battlePoint) return false;
    if(this.damageRate != target.damageRate) return false;
    if(this.type != target.type) return false;
    return true;
  }
}