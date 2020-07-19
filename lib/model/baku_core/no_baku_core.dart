import 'baku_core.dart';
import 'baku_core_type.dart';

class NoBakuCore extends BakuCore {
  bool get isNoCore => true;

  bool get isSuccess => false;

  NoBakuCore() : super(0, 0, BakuCoreType.None);
}
