import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('init MainBloc', () {
    // 準備
    var mainBloc = MainBloc();

    // テスト
    // Arenaの状態
    expect(mainBloc.isShotBakugan(), false);
    expect(mainBloc.isSuccessShoot(TeamPosition.Right), false);
    expect(mainBloc.isSuccessShoot(TeamPosition.Left), false);
    expect(() => mainBloc.getShotBakuCoreType(TeamPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuCoreType(TeamPosition.Left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(TeamPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(TeamPosition.Left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(TeamPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(TeamPosition.Left),
        throwsStateError);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);
  });

  test('shoot Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.Right) &&
        mainBloc.isSuccessShoot(TeamPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }

    // テスト
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.Right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Right) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Right) !=
            BakuCoreType.Failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.Left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Left) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Left) !=
            BakuCoreType.Failed,
        true);
  });

  test('store failed Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    expect(
        () => mainBloc.storeCores(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    while ((mainBloc.isSuccessShoot(TeamPosition.Right))) {
      //Rightが失敗になるまで
      mainBloc.shootBakugans();
    }
    expect(
        () => mainBloc.storeCores(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
  });

  test('store Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.Right) &&
        mainBloc.isSuccessShoot(TeamPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc.storeCores(TeamPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.storeCores(TeamPosition.Left, TeamBakuCorePosition.Pos2);

    // テスト
    // 右プレイヤー
    expect(
        () => mainBloc.storeCores(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Right),
        mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos1));
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Right),
        mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos1));
    // 左プレイヤー
    expect(() =>
        mainBloc.storeCores(TeamPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Left),
        mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos2));
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Left),
        mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos2));
  });

  test('remove Team\'s Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.Right) &&
        mainBloc.isSuccessShoot(TeamPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc.storeCores(TeamPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.removeCores(TeamPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.storeCores(TeamPosition.Left, TeamBakuCorePosition.Pos2);
    mainBloc.removeCores(TeamPosition.Left, TeamBakuCorePosition.Pos2);

    // Arenaの状態
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.Right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Right) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Right) !=
            BakuCoreType.Failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.Left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Left) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.Left) !=
            BakuCoreType.Failed,
        true);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);
  });
}
