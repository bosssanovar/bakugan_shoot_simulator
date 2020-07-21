import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('init MainBloc', () {
    // 準備
    final mainBloc = MainBloc();

    // テスト
    // Arenaの状態
    expect(mainBloc.isShotBakugan(), false);
    expect(mainBloc.isSuccessShoot(TeamPosition.right), false);
    expect(mainBloc.isSuccessShoot(TeamPosition.left), false);
    expect(() => mainBloc.getShotBakuCoreType(TeamPosition.right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuCoreType(TeamPosition.left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(TeamPosition.right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganBattlePoint(TeamPosition.left),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(TeamPosition.right),
        throwsStateError);
    expect(() => mainBloc.getShotBakuganDamageRate(TeamPosition.left),
        throwsStateError);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        throwsStateError);
  });

  test('shoot Bakugans', () {
    // 準備
    final mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.right) &&
        mainBloc.isSuccessShoot(TeamPosition.left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }

    // テスト
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.right) != BakuCoreType.none,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.right) !=
            BakuCoreType.failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.left) != BakuCoreType.none,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.left) !=
            BakuCoreType.failed,
        true);
  });

  test('store failed Bakugans', () {
    // 準備
    final mainBloc = MainBloc();
    expect(
        () => mainBloc.storeCores(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    while (mainBloc.isSuccessShoot(TeamPosition.right)) {
      //Rightが失敗になるまで
      mainBloc.shootBakugans();
    }
    expect(
        () => mainBloc.storeCores(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
  });

  test('store Bakugans', () {
    // 準備
    final mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.right) &&
        mainBloc.isSuccessShoot(TeamPosition.left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc
      ..storeCores(TeamPosition.right, TeamBakuCorePosition.pos1)
      ..storeCores(TeamPosition.left, TeamBakuCorePosition.pos2);

    // テスト
    // 右プレイヤー
    expect(
        () => mainBloc.storeCores(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.right),
        mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos1));
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.right),
        mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos1));
    // 左プレイヤー
    expect(() =>
        mainBloc.storeCores(TeamPosition.left, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        true);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        false);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.left),
        mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos2));
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.left),
        mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos2));
  });

  test('remove Team\'s Bakugans', () {
    // 準備
    final mainBloc = MainBloc();
    while (!(mainBloc.isSuccessShoot(TeamPosition.right) &&
        mainBloc.isSuccessShoot(TeamPosition.left))) {
      //どちらもshoot成功になるまで
      mainBloc.shootBakugans();
    }
    mainBloc
      ..storeCores(TeamPosition.right, TeamBakuCorePosition.pos1)
      ..removeCores(TeamPosition.right, TeamBakuCorePosition.pos1)
      ..storeCores(TeamPosition.left, TeamBakuCorePosition.pos2)
      ..removeCores(TeamPosition.left, TeamBakuCorePosition.pos2);

    // Arenaの状態
    expect(mainBloc.isShotBakugan(), true);
    // 右プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.right), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.right) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.right) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.right) != BakuCoreType.none,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.right) !=
            BakuCoreType.failed,
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.left) != BakuCoreType.none,
        true);
    expect(
        mainBloc.getShotBakuCoreType(TeamPosition.left) !=
            BakuCoreType.failed,
        true);

    // Playerの状態
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        false);
    expect(
        mainBloc.isExistTeamsBakuCore(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        false);

    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsDamageRate(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        throwsStateError);

    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.right, TeamBakuCorePosition.pos3),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos1),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos2),
        throwsStateError);
    expect(
        () => mainBloc.getTeamsBakuCoreType(
            TeamPosition.left, TeamBakuCorePosition.pos3),
        throwsStateError);
  });
}
