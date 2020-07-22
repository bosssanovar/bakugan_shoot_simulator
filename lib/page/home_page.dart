import 'dart:io';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/footer_buttons.dart';
import 'package:bakugan_shoot_simulator/widget/header_buttons.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: teamPosition == TeamPosition.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: <Widget>[
        !_bloc.isExistTeamsBakuCore(teamPosition, TeamBakuCorePosition.pos1)
            ? _buildCoreAddButton(
            teamPosition, TeamBakuCorePosition.pos1)
            : _buildTeamBakuCore(
            teamPosition, TeamBakuCorePosition.pos1),
        !_bloc.isExistTeamsBakuCore(
            teamPosition, TeamBakuCorePosition.pos2)
            ? _buildCoreAddButton(
            teamPosition, TeamBakuCorePosition.pos2)
            : _buildTeamBakuCore(
            teamPosition, TeamBakuCorePosition.pos2),
        !_bloc.isExistTeamsBakuCore(
            teamPosition, TeamBakuCorePosition.pos3)
            ? _buildCoreAddButton(
            teamPosition, TeamBakuCorePosition.pos3)
            : _buildTeamBakuCore(
            teamPosition, TeamBakuCorePosition.pos3),
      ],
    );
  }

  Widget _buildPlayerGetBakuCore(BuildContext context,
      TeamPosition teamPosition) {
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

  Widget _buildCoreAddButton(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return IconButton(
      onPressed: (){
        if (_isLeft(playerPosition) &&
            !_bloc.isSuccessShoot(TeamPosition.left)) {
          _showCantAddTeamDialog();
          return;
        }
        if (_isRight(playerPosition) &&
            !_bloc.isSuccessShoot(TeamPosition.right)) {
          _showCantAddTeamDialog();
          return;
        }

        setState(() {
          _bloc.storeCores(playerPosition, teamBakuCorePosition);
        });
      },
      icon: Icon(Icons.add_circle_outline),
    );
  }

  Widget _buildTeamBakuCore(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return Row(
      mainAxisAlignment: _isLeft(playerPosition)
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        _isLeft(playerPosition)
            ? _buildRemoveButton(playerPosition, teamBakuCorePosition)
            : Container(),
        Column(
          crossAxisAlignment: _isLeft(playerPosition)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: <Widget>[
            Text(
                _getTeamsDamageRateText(
                    playerPosition, teamBakuCorePosition)
            ),
            Text(
                _getTeamsBakuCoreTypeText(
                    playerPosition, teamBakuCorePosition)
            ),
          ],
        ),
        _isRight(playerPosition)
            ? _buildRemoveButton(playerPosition, teamBakuCorePosition)
            : Container()
      ],
    );
  }

  Widget _buildRemoveButton(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return IconButton(
      icon: Icon(Icons.remove_circle),
      onPressed: () async {
        await _removeTeamBakuCore(playerPosition, teamBakuCorePosition);
      },
    );
  }

  Future _removeTeamBakuCore(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) async {
    if(!(await _showRemoveConfirmDialog())){
      return;
    }

    setState(() {
      _bloc.removeCores(playerPosition, teamBakuCorePosition);
    });
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

  String _getTeamsDamageRateText(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return 'DR : ${
        _bloc.getTeamsDamageRate(playerPosition,
            teamBakuCorePosition)
    }';
  }

  String _getTeamsBakuCoreTypeText(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return '${
        _bloc
            .getTeamsBakuCoreType(playerPosition, teamBakuCorePosition)
            .text
    }';
  }

  void _showCantAddTeamDialog() {
    showDialog<int>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
            title: Text('Error'),
            content: Text('You can not keep an invalid core.')
        );
      },
    );
  }

  Future<bool> _showRemoveConfirmDialog() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text(
              'Are you sure you want to delete the selected baku core?'
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    return result;
  }

  bool _isLeft(TeamPosition pos) {
    switch(pos){
      case TeamPosition.right:
        return false;
      case TeamPosition.left:
        return true;
    }
    throw Error();
  }

  bool _isRight(TeamPosition pos) {
    return !_isLeft(pos);
  }
}
