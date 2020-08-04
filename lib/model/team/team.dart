import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_cores.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';

class Team {

  Team() {
    initTeamBakuCores();
  }

  final _teamBakuCores = <TeamBakuCorePosition, BakuCores>{};

  int getBakuCoreCount(TeamBakuCorePosition position) {
    return _teamBakuCores[position].getBakuCores().length;
  }

  void initTeamBakuCores() {
    _teamBakuCores[TeamBakuCorePosition.pos1]?.clear();
    _teamBakuCores[TeamBakuCorePosition.pos2]?.clear();
    _teamBakuCores[TeamBakuCorePosition.pos3]?.clear();
    _teamBakuCores[TeamBakuCorePosition.pos1] = BakuCores();
    _teamBakuCores[TeamBakuCorePosition.pos2] = BakuCores();
    _teamBakuCores[TeamBakuCorePosition.pos3] = BakuCores();
  }

  bool isBakuCoreFull() {
    return isExistBakuCore(TeamBakuCorePosition.pos1) &&
        isExistBakuCore(TeamBakuCorePosition.pos2) &&
        isExistBakuCore(TeamBakuCorePosition.pos3);
  }

  void clearTeamBakuCores() {
    removeTeamBakuCore(TeamBakuCorePosition.pos1);
    removeTeamBakuCore(TeamBakuCorePosition.pos2);
    removeTeamBakuCore(TeamBakuCorePosition.pos3);
  }

  bool isExistBakuCore(TeamBakuCorePosition position) {
    return !_teamBakuCores[position].isNoCore() &&
        _teamBakuCores[position].isSuccessCurrentCore();
  }

  void storeTeamBakuCores(
      List<BakuCore> bakuCores,
      TeamBakuCorePosition position) {
    if (!_teamBakuCores[position].isNoCore()) {
      throw StateError('$position is already stored.');
    }
    for(final core in bakuCores) {
      if (!core.isSuccess) {
        throw ArgumentError();
      }
    }
    _teamBakuCores[position].addAll(bakuCores);
  }

  void removeTeamBakuCore(TeamBakuCorePosition position) {
    _teamBakuCores[position].clear();
  }

  int getDamageRate(TeamBakuCorePosition position) {
    if (!isExistBakuCore(position)) {
      throw StateError('$position is not stored baku core yet.');
    }
    return _teamBakuCores[position].getTotalDamageRate();
  }

  List<BakuCoreType> getBakuCoreType(TeamBakuCorePosition position) {
    if (!isExistBakuCore(position)) {
      throw StateError('$position is not stored baku core yet.');
    }
    return _teamBakuCores[position].getTypes();
  }
}
