import 'baku_core.dart';
import 'baku_core_type.dart';

class NoBakuCore extends BakuCore {

  NoBakuCore() : super(0, 0, BakuCoreType.none);

  @override
  bool get isNoCore => true;
  @override
  bool get isSuccess => false;
}
