import 'dart:core';

import 'package:bakugan_shoot_simulator/model/action_card/action_card.dart';
import 'package:bakugan_shoot_simulator/model/arena/arena.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';

class MainBloc {
  final Map<TeamPosition, Team> _teams = <TeamPosition, Team>{
    TeamPosition.left: Team(),
    TeamPosition.right: Team(),
  };
  final Arena _arena = Arena();

  // Team

  void storeCores(
      TeamPosition teamPosition, TeamBakuCorePosition teamBakuCorePosition) {
    _teams[teamPosition].storeTeamBakuCores(
        _arena.getBakuCores(teamPosition), teamBakuCorePosition);
  }

  void removeCores(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    _teams[teamPosition].removeTeamBakuCore(teamBakuCorePosition);
  }

  int getTeamsDamageRate(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[teamPosition].getDamageRate(teamBakuCorePosition);
  }

  List<BakuCoreType> getTeamsBakuCoreType(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[teamPosition].getBakuCoreType(teamBakuCorePosition);
  }

  int getTeamsBakuCoreCount(
      TeamPosition teamPosition, TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[teamPosition].getBakuCoreCount(teamBakuCorePosition);
  }

  bool isExistTeamsBakuCore(TeamPosition teamPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return _teams[teamPosition].isExistBakuCore(teamBakuCorePosition);
  }

  bool isTeamBakuCoreFull(TeamPosition teamPosition) {
    return _teams[teamPosition].isBakuCoreFull();
  }

  void clearTeamBakuCores(TeamPosition teamPosition) {
    _teams[teamPosition].clearTeamBakuCores();
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

  void shootToGetOneMoreCore(TeamPosition teamPosition) {
    _arena.shootToGetOneMoreBakuCore(teamPosition);
  }

  int getCurrentBakuCoresCount(TeamPosition teamPosition) {
    return _arena.getBakuCores(teamPosition).length;
  }

  // action card

  void addActionCard(TeamPosition teamPosition,
      {int battlePoint = 0, int damageRate = 0}) {
    _arena.addCard(teamPosition,
        battlePoint: battlePoint, damageRate: damageRate);
  }

  int getActionCardBattlePointTotal(TeamPosition teamPosition) {
    return _arena.getActionCardBattlePointTotal(teamPosition);
  }

  int getActionCardDamageRate(TeamPosition teamPosition) {
    return _arena.getActionCardDamageRate(teamPosition);
  }

  List<ActionCard> getActionCards(TeamPosition teamPosition) {
    return _arena.getActionCards(teamPosition);
  }

  void clearActionCards() {
    _arena.clearActionCard();
  }
}
