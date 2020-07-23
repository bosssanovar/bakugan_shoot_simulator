import 'dart:io';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/footer_buttons.dart';
import 'package:bakugan_shoot_simulator/widget/header_buttons.dart';
import 'package:bakugan_shoot_simulator/widget/team_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return SafeArea(
        child: _buildBody(context),
      );
    }
    return _buildBody(context);
  }

  Scaffold _buildBody(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Stack(
        children: <Widget>[
          _buildBackGrounds(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: _buildTeam(TeamPosition.left)),
                Expanded(
                  child: _buildPlayerGetBakuCore(context, TeamPosition.left),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'V.S.',
                  ),
                ),
                Expanded(
                  child: _buildPlayerGetBakuCore(context, TeamPosition.right),
                ),
                Expanded(child: _buildTeam(TeamPosition.right)),
              ],
            ),
          ),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildBackGrounds() {
    return Container();
  }

  Widget _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildHeaderButtons(),
        _buildFooterButtons(),
      ],
    );
  }

  Widget _buildHeaderButtons() {
    return HeaderButtons(
      isShotBakugan: _bloc.isShotBakugan(),
      onPressSwap: () {
        setState(_bloc.swapBakuCores);
      },
      onPressReshootLeft: (){
        setState(() {
          _bloc.reShootBakugan(TeamPosition.left);
        });
      },
      onPressReshootRight: () {
        setState(() {
          _bloc.reShootBakugan(TeamPosition.right);
        });
      },
    );
  }

  Widget _buildFooterButtons() {
    return FooterButtons(
      onShootBakugans: (){
        setState(_bloc.shootBakugans);
      },
    );
  }

  Widget _buildTeam(TeamPosition teamPosition) {
    return TeamArea(
        isLeft: teamPosition == TeamPosition.left,
        isShotSuccess: _bloc.isSuccessShoot(teamPosition),
        team1:
            _bloc.isExistTeamsBakuCore(teamPosition, TeamBakuCorePosition.pos1)
                ? createTeamAreaElement(teamPosition, TeamBakuCorePosition.pos1)
                : null,
        team2:
            _bloc.isExistTeamsBakuCore(teamPosition, TeamBakuCorePosition.pos2)
                ? createTeamAreaElement(teamPosition, TeamBakuCorePosition.pos2)
                : null,
        team3:
            _bloc.isExistTeamsBakuCore(teamPosition, TeamBakuCorePosition.pos3)
                ? createTeamAreaElement(teamPosition, TeamBakuCorePosition.pos3)
                : null,
        onStoreBakuCore: (position) {
          setState(() {
            _bloc.storeCores(teamPosition, getTeamBakuCorePosition(position));
          });
        },
        onRemoveBakuCore: (position) {
          setState(() {
            _bloc.removeCores(teamPosition, getTeamBakuCorePosition(position));
          });
        });
  }

  TeamAreaElement createTeamAreaElement(
      TeamPosition teamPosition, TeamBakuCorePosition teamBakuCorePosition) {
    return TeamAreaElement(
      damageRate: _bloc.getTeamsDamageRate(teamPosition, teamBakuCorePosition),
      bakuCoreType:
          _bloc.getTeamsBakuCoreType(teamPosition, teamBakuCorePosition).text,
    );
  }

  Widget _buildPlayerGetBakuCore(
      BuildContext context, TeamPosition teamPosition) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: teamPosition == TeamPosition.left
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${_getBattlePointText(teamPosition)}',
          style: Theme
              .of(context)
              .textTheme
              .display1,
        ),
        Text(
          '${_getShotDamageRateText(teamPosition)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotTypeText(teamPosition)}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }
  String _getBattlePointText(TeamPosition position) {
    if (!_bloc.isShotBakugan()) {
      return '';
    }
    if (!_bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'BP : ${_bloc.getShotBakuganBattlePoint(position)}';
  }

  String _getShotDamageRateText(TeamPosition position) {
    if (!_bloc.isShotBakugan()) {
      return '';
    }
    if (!_bloc.isSuccessShoot(position)) {
      return '-';
    }
    return 'DR : ${_bloc.getShotBakuganDamageRate(position)}';
  }

  String _getShotTypeText(TeamPosition position) {
    if (!_bloc.isShotBakugan()) {
      return '';
    }
    if (!_bloc.isSuccessShoot(position)) {
      return '-';
    }
    return '${_bloc
        .getShotBakuCoreType(position)
        .text}';
  }

  TeamBakuCorePosition getTeamBakuCorePosition(BakuCorePosition position) {
    switch (position) {
      case BakuCorePosition.pos1:
        return TeamBakuCorePosition.pos1;
      case BakuCorePosition.pos2:
        return TeamBakuCorePosition.pos2;
      case BakuCorePosition.pos3:
        return TeamBakuCorePosition.pos3;
    }
    throw ArgumentError();
  }
}
