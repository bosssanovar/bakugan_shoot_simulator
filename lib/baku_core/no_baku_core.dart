import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';

class NoBakuCore extends BakuCore {

  bool get isNoCore => true;

  NoBakuCore()
      : super(0, 0, BakuCoreType.None);


}