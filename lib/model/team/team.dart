import 'package:bakugan_shoot_simulator/model/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/no_baku_core.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';

class Team {
  final _teamBakuCores = Map<TeamBakuCorePosition, BakuCore>();

  Team() {
    initTeamBakuCores();
  }

  void initTeamBakuCores() {
    _teamBakuCores.clear();
    _teamBakuCores[TeamBakuCorePosition.Pos1] = NoBakuCore();
    _teamBakuCores[TeamBakuCorePosition.Pos2] = NoBakuCore();
    _teamBakuCores[TeamBakuCorePosition.Pos3] = NoBakuCore();
  }

  bool isExistBakuCore(TeamBakuCorePosition position) {
    return (!_teamBakuCores[position].isNoCore &&
        _teamBakuCores[position].isSuccess);
  }

  void storeTeamBakuCores(BakuCore bakuCore, TeamBakuCorePosition position) {
    if (!_teamBakuCores[position].isNoCore) {
      throw StateError('$position is already stored.');
    }
    if (!bakuCore.isSuccess) {
      throw ArgumentError();
    }
    _teamBakuCores[position] = bakuCore;
  }

  void removeTeamBakuCore(TeamBakuCorePosition position) {
    _teamBakuCores[position] = NoBakuCore();
  }

  int getDamageRate(TeamBakuCorePosition position) {
    if (!isExistBakuCore(position)) {
      throw StateError('$position is not stored baku core yet.');
    }
    return _teamBakuCores[position].damageRate;
  }

  BakuCoreType getBakuCoreType(TeamBakuCorePosition position) {
    if (!isExistBakuCore(position)) {
      throw StateError('$position is not stored baku core yet.');
    }
    return _teamBakuCores[position].type;
  }
}
