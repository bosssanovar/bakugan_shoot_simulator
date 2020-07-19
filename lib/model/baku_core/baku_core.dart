import 'baku_core_type.dart';

class BakuCore {
  final int battlePoint;
  final int damageRate;
  final BakuCoreType type;

  bool get isNoCore => false;

  bool get isSuccess => type != BakuCoreType.Failed;

  const BakuCore(this.battlePoint, this.damageRate, this.type);

  equal(BakuCore target) {
    if (this.battlePoint != target.battlePoint) return false;
    if (this.damageRate != target.damageRate) return false;
    if (this.type != target.type) return false;
    return true;
  }
}