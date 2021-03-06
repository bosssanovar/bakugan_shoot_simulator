import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
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
        !mainBloc.getShotBakuCoreType(TeamPosition.right)
            .contains(BakuCoreType.none),
        true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.right)
            .contains(BakuCoreType.failed),
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.left) > -9999, true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.left)
            .contains(BakuCoreType.none),
        true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.left)
            .contains(BakuCoreType.failed),
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
        !mainBloc.getShotBakuCoreType(TeamPosition.right)
            .contains(BakuCoreType.none),
        true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.right)
            .contains(BakuCoreType.failed),
        true);
    // 左プレイヤー
    expect(mainBloc.isSuccessShoot(TeamPosition.left), true);
    expect(
        mainBloc.getShotBakuganDamageRate(TeamPosition.left) > -9999, true);
    expect(
        mainBloc.getShotBakuganBattlePoint(TeamPosition.left) > -9999, true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.left)
            .contains(BakuCoreType.none),
        true);
    expect(
        !mainBloc.getShotBakuCoreType(TeamPosition.left)
            .contains(BakuCoreType.failed),
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

  test('add/clear ActionCards', () {
    // 準備
    final mainBloc = MainBloc();

    // 初期状態テスト
    expect(mainBloc.getActionCards(TeamPosition.left).length, 0);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.left), 0);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.left), 0);
    expect(mainBloc.getActionCards(TeamPosition.right).length, 0);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.right), 0);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.right), 0);

    // 追加
    mainBloc
      ..addActionCard(TeamPosition.left, battlePoint: 100, damageRate: 1)
      ..addActionCard(TeamPosition.left, battlePoint: 200, damageRate: 2)
      ..addActionCard(TeamPosition.left, battlePoint: 300, damageRate: 3)
      ..addActionCard(TeamPosition.right, battlePoint: -100, damageRate: -1)
      ..addActionCard(TeamPosition.right, battlePoint: 200, damageRate: 2)
      ..addActionCard(TeamPosition.right, battlePoint: 300, damageRate: 3)
      ..addActionCard(TeamPosition.right, battlePoint: 400, damageRate: 4)
      ..addActionCard(TeamPosition.right, battlePoint: 500)
      ..addActionCard(TeamPosition.right, damageRate: 5);

    // 追加結果テスト
    expect(mainBloc.getActionCards(TeamPosition.left).length, 3);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.left), 600);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.left), 6);
    expect(mainBloc.getActionCards(TeamPosition.right).length, 6);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.right), 1300);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.right), 13);

    // クリア
    mainBloc.clearActionCards();

    // クリア結果テスト
    expect(mainBloc.getActionCards(TeamPosition.left).length, 0);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.left), 0);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.left), 0);
    expect(mainBloc.getActionCards(TeamPosition.right).length, 0);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.right), 0);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.right), 0);
  });

  test('swap arena bakugans', () {
    // 準備
    // BakuCore Typeをバラバラに
    final mainBloc = MainBloc()..shootBakugans();
    while (!mainBloc.isSuccessShoot(TeamPosition.right) ||
        !mainBloc.isSuccessShoot(TeamPosition.left) ||
        (mainBloc.getShotBakuCoreType(TeamPosition.right).first ==
            mainBloc.getShotBakuCoreType(TeamPosition.left).first)) {
      mainBloc.shootBakugans();
    }
    final rightType = mainBloc.getShotBakuCoreType(TeamPosition.right).first;
    final leftType = mainBloc.getShotBakuCoreType(TeamPosition.left).first;
    // アクションカードを設定
    mainBloc
      ..addActionCard(TeamPosition.right, battlePoint: 1, damageRate: 1)
      ..addActionCard(TeamPosition.left, battlePoint: -1, damageRate: -1);
    final rightBP = mainBloc.getActionCardBattlePointTotal(TeamPosition.right);
    final rightDR = mainBloc.getActionCardDamageRate(TeamPosition.right);
    final leftBP = mainBloc.getActionCardBattlePointTotal(TeamPosition.left);
    final leftDR = mainBloc.getActionCardDamageRate(TeamPosition.left);

    // swap実行
    mainBloc.swapBakuCores();

    // テスト
    expect(mainBloc.getShotBakuCoreType(TeamPosition.left).first, rightType);
    expect(mainBloc.getShotBakuCoreType(TeamPosition.right).first, leftType);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.right), rightBP);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.right), rightDR);
    expect(mainBloc.getActionCardBattlePointTotal(TeamPosition.left), leftBP);
    expect(mainBloc.getActionCardDamageRate(TeamPosition.left), leftDR);
  });

  test('Failed swapping', () {
    // 準備
    // BakuCore Typeをバラバラに
    final mainBloc = MainBloc()..shootBakugans();
    while (mainBloc.isSuccessShoot(TeamPosition.right) &&
        mainBloc.isSuccessShoot(TeamPosition.left)) {
      mainBloc.shootBakugans();
    }

    // swap実行
    expect(mainBloc.swapBakuCores, throwsStateError);
  });
}
