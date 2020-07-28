import 'dart:core';

import 'package:bakugan_shoot_simulator/model/arena/arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';

class MainBloc {

  MainBloc() {
    _teams[TeamPosition.left] = Team();
    _teams[TeamPosition.right] = Team();
  }

  final Map<TeamPosition, Team> _teams = <TeamPosition, Team>{};
  final Arena _arena = Arena();

  // Team

  void storeCores(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _teams[playerPosition].storeTeamBakuCores(
        _arena.getBakuCores(playerPosition), teamBakuCorePosition);
  }

  void removeCores(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _teams[playerPosition].removeTeamBakuCore(teamBakuCorePosition);
  }

  int getTeamsDamageRate(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[playerPosition].getDamageRate(teamBakuCorePosition);
  }

  List<BakuCoreType> getTeamsBakuCoreType(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[playerPosition].getBakuCoreType(teamBakuCorePosition);
  }

  bool isExistTeamsBakuCore(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[playerPosition].isExistBakuCore(teamBakuCorePosition);
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

  List<BakuCoreType> getShotBakuCoreTypes(TeamPosition playerPosition) {
    return _arena.getBakuCoreTypes(playerPosition);
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

  void shootToGetOneMoreBakuCore(TeamPosition position) {
    _arena.shootToGetOneMoreBakuCore(position);
  }
}
