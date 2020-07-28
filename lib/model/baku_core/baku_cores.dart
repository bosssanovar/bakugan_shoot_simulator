import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';

class BakuCores {

  final List<BakuCore> _bakuCores = [];

  int get count => _bakuCores.length;

  void add(BakuCore bakuCore) {
    _bakuCores.add(bakuCore);
  }

  void addAll(List<BakuCore> bakuCores) {
    _bakuCores.addAll(bakuCores);
  }

  void remove(BakuCore bakuCore){
    _bakuCores.remove(bakuCore);
  }

  void clear(){
    _bakuCores.clear();
  }

  bool isNoCore(){
    return _bakuCores.isEmpty;
  }

  bool isSuccessCurrentCore(){
    return !isNoCore() && _bakuCores[0].isSuccess;
  }

  List<BakuCore> getBakuCores(){
    return _bakuCores;
  }

  int getTotalBattlePoint(){
    var sum = 0;
    for(final core in _bakuCores){
      sum += core.battlePoint;
    }
    return sum;
  }

  int getTotalDamageRate(){
    var sum = 0;
    for(final core in _bakuCores){
      sum += core.damageRate;
    }
    return sum;
  }

  List<BakuCoreType> getTypes(){
    List<BakuCoreType> ret = [];
    for(final core in _bakuCores){
      if(!ret.contains(core.type)){
        ret.add(core.type);
      }
    }
    return ret;
  }
}