import 'baku_core_type.dart';

class BakuCore {

  const BakuCore(this.battlePoint, this.damageRate, this.type);

  final int battlePoint;
  final int damageRate;
  final BakuCoreType type;

  bool get isNoCore => false;

  bool get isSuccess => type != BakuCoreType.failed;

  bool equal(BakuCore target) {
    if (battlePoint != target.battlePoint) {
      return false;
    }
    if (damageRate != target.damageRate) {
      return false;
    }
    if (type != target.type) {
      return false;
    }
    return true;
  }
}