import 'dart:core';

import 'package:bakugan_shoot_simulator/model/arena/arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';

class MainBloc {

  MainBloc() {
    _players[TeamPosition.left] = Team();
    _players[TeamPosition.right] = Team();
  }

  final Map<TeamPosition, Team> _players = <TeamPosition, Team>{};
  final Arena _arena = Arena();

  // Player

  void storeCores(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _players[playerPosition].storeTeamBakuCores(
        _arena.getBakuCore(playerPosition), teamBakuCorePosition);
  }

  void removeCores(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _players[playerPosition].removeTeamBakuCore(teamBakuCorePosition);
  }

  int getTeamsDamageRate(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].getDamageRate(teamBakuCorePosition);
  }

  BakuCoreType getTeamsBakuCoreType(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].getBakuCoreType(teamBakuCorePosition);
  }

  bool isExistTeamsBakuCore(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].isExistBakuCore(teamBakuCorePosition);
  }

  // Arena

  void shootBakugans() {
    _arena.shootBakgans();
  }

  int getShotBakuganBattlePoint(TeamPosition playerPosition) {
    return _arena.getBattlePoint(playerPosition);
  }

  int getShotBakuganDamageRate(TeamPosition playerPosition) {
    return _arena.getDamageRate(playerPosition);
  }

  BakuCoreType getShotBakuCoreType(TeamPosition playerPosition) {
    return _arena.getBakuCoreType(playerPosition);
  }

  bool isShotBakugan() {
    return _arena.isShotBakugan();
  }

  bool isSuccessShoot(TeamPosition playerPosition) {
    return _arena.isShotSuccess(playerPosition);
  }

  void reShootBakugan(TeamPosition position) {
    _arena.reShootBakugan(position);
  }

  void swapBakuCores(){
    _arena.swapBakuCores();
  }
}
