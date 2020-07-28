import 'dart:core';

import 'package:bakugan_shoot_simulator/model/arena/arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';

class MainBloc {

  MainBloc() {
    _players[TeamPosition.left] = Team();
    _players[TeamPosition.right] = Team();
  }

  final Map<TeamPosition, Team> _players = <TeamPosition, Team>{};
  final Arena _arena = Arena();

  // Player

  void storeCores(
      TeamPosition teamPosition, TeamBakuCorePosition teamBakuCorePosition) {
    _players[teamPosition].storeTeamBakuCores(
        _arena.getBakuCores(teamPosition), teamBakuCorePosition);
  }

  void removeCores(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _players[teamPosition].removeTeamBakuCore(teamBakuCorePosition);
  }

  int getTeamsDamageRate(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[teamPosition].getDamageRate(teamBakuCorePosition);
  }

  List<BakuCoreType> getTeamsBakuCoreType(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[teamPosition].getBakuCoreType(teamBakuCorePosition);
  }

  bool isExistTeamsBakuCore(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[teamPosition].isExistBakuCore(teamBakuCorePosition);
  }

  // Arena

  void shootBakugans() {
    _arena.shootBakgans();
  }

  int getShotBakuganBattlePoint(TeamPosition teamPosition) {
    return _arena.getBattlePoint(teamPosition);
  }

  int getShotBakuganDamageRate(TeamPosition teamPosition) {
    return _arena.getDamageRate(teamPosition);
  }

  List<BakuCoreType> getShotBakuCoreType(TeamPosition teamPosition) {
    return _arena.getBakuCoreTypes(teamPosition);
  }

  bool isShotBakugan() {
    return _arena.isShotBakugan();
  }

  bool isSuccessShoot(TeamPosition teamPosition) {
    return _arena.isShotSuccess(teamPosition);
  }

  void reShootBakugan(TeamPosition teamPosition) {
    _arena.reShootBakugan(teamPosition);
  }

  void swapBakuCores() {
    _arena.swapBakuCores();
  }

  void getOneMoreCore(TeamPosition teamPosition){
    _arena.shootToGetOneMoreBakuCore(teamPosition);
  }
}
