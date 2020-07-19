import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/player/player_position.dart';
import 'package:bakugan_shoot_simulator/model/player/team_baku_core_position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('init MainBloc', () {
    // 準備
    var mainBloc = MainBloc();

    // テスト
    // Arenaの状態
    expect(mainBloc.isShotBakugan(), false);
    expect(mainBloc.isSuccessShoot(PlayerPosition.Right), false);
    expect(mainBloc.isSuccessShoot(PlayerPosition.Left), false);
    expect(() => mainBloc.getShotBakuCoreType(PlayerPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuCoreType(PlayerPosition.Left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(PlayerPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(PlayerPosition.Left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(PlayerPosition.Right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(PlayerPosition.Left),
        throwsStateError);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);
  });

  test('shoot Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(PlayerPosition.Right) &&
        mainBloc.isSuccessShoot(PlayerPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }

    // テスト
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(PlayerPosition.Right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(PlayerPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Right) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Right) !=
            BakuCoreType.Failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(PlayerPosition.Left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(PlayerPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Left) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Left) !=
            BakuCoreType.Failed,
        true);
  });

  test('store failed Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    expect(
        () => mainBloc.storeCores(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    while ((mainBloc.isSuccessShoot(PlayerPosition.Right))) {
      //Rightが失敗になるまで
      mainBloc.shootBakugans();
    }
    expect(
        () => mainBloc.storeCores(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
  });

  test('store Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(PlayerPosition.Right) &&
        mainBloc.isSuccessShoot(PlayerPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc.storeCores(PlayerPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.storeCores(PlayerPosition.Left, TeamBakuCorePosition.Pos2);

    // テスト
    // 右プレイヤー
    expect(
        () => mainBloc.storeCores(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Right),
        mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1));
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Right),
        mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1));
    // 左プレイヤー
    expect(() =>
        mainBloc.storeCores(PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Left),
        mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2));
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Left),
        mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2));
  });

  test('remove Team\'s Bakugans', () {
    // 準備
    var mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(PlayerPosition.Right) &&
        mainBloc.isSuccessShoot(PlayerPosition.Left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc.storeCores(PlayerPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.removeCores(PlayerPosition.Right, TeamBakuCorePosition.Pos1);
    mainBloc.storeCores(PlayerPosition.Left, TeamBakuCorePosition.Pos2);
    mainBloc.removeCores(PlayerPosition.Left, TeamBakuCorePosition.Pos2);

    // Arenaの状態
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(PlayerPosition.Right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(PlayerPosition.Right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Right) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Right) !=
            BakuCoreType.Failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(PlayerPosition.Left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(PlayerPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(PlayerPosition.Left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Left) != BakuCoreType.None,
        true);
    expect(
        mainBloc.getShotBakuCoreType(PlayerPosition.Left) !=
            BakuCoreType.Failed,
        true);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Right, TeamBakuCorePosition.Pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            PlayerPosition.Left, TeamBakuCorePosition.Pos3),
        throwsStateError);
  });
}
