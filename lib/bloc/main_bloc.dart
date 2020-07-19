import 'dart:core';

import 'package:bakugan_shoot_simulator/model/arena/arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/player/player.dart';
import 'package:bakugan_shoot_simulator/model/player/player_position.dart';
import 'package:bakugan_shoot_simulator/model/player/team_baku_core_position.dart';

class MainBloc {
  final Map<PlayerPosition, Player> _players = Map<PlayerPosition, Player>();
  final Arena _arena = Arena();

  MainBloc() {
    _players[PlayerPosition.Left] = Player();
    _players[PlayerPosition.Right] = Player();
  }

  // Player

  void storeCores(PlayerPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _players[playerPosition].storeTeamBakuCores(
        _arena.getBakuCore(playerPosition), teamBakuCorePosition);
  }

  void removeCores(PlayerPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _players[playerPosition].removeTeamBakuCore(teamBakuCorePosition);
  }

  int getTeamsDamageRate(PlayerPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].getDamageRate(teamBakuCorePosition);
  }

  BakuCoreType getTeamsBakuCoreType(PlayerPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].getBakuCoreType(teamBakuCorePosition);
  }

  bool isExistTeamsBakuCore(PlayerPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _players[playerPosition].isExistBakuCore(teamBakuCorePosition);
  }

  // Arena

  void shootBakugans() {
    _arena.shootBakgans();
  }

  int getShotBakuganBattlePoint(PlayerPosition playerPosition) {
    return _arena.getBattlePoint(playerPosition);
  }

  int getShotBakuganDamageRate(PlayerPosition playerPosition) {
    return _arena.getDamageRate(playerPosition);
  }

  BakuCoreType getShotBakuCoreType(PlayerPosition playerPosition) {
    return _arena.getBakuCoreType(playerPosition);
  }

  bool isShotBakugan() {
    return _arena.isShotBakugan();
  }

  bool isSuccessShoot(PlayerPosition playerPosition) {
    return _arena.isShotSuccess(playerPosition);
  }
}
