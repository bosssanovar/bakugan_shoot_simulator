import 'dart:io';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';

import 'model/baku_core/baku_core_type.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  Screen.keepOn(true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bakugan shoot simulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainBloc _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return SafeArea(
        child: buildBody(context),
      );
    }
    return buildBody(context);
  }

  Scaffold buildBody(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: _buildLeftTeam()),
            Expanded(
              child: _buildLeftPlayerGetBakuCore(context),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'V.S.',
              ),
            ),
            Expanded(
              child: _buildRightPlayerGetBakuCore(context),
            ),
            Expanded(child: _buildRightTeam()),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  disabledElevation: 0,
                  backgroundColor: _bloc.isShotBakugan()
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPressed: !_bloc.isShotBakugan()
                      ? null
                      : () {
//                      setState(() {
//                        _bloc.reShootBakugan(PlayerPosition.Right);
//                      });
                      },
                  tooltip: 'add left',
                  child: Icon(Icons.plus_one),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  disabledElevation: 0,
                  backgroundColor: _bloc.isShotBakugan()
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPressed: !_bloc.isShotBakugan()
                      ? null
                      : () {
                        setState(() {
                          _bloc.reShootBakugan(TeamPosition.Left);
                        });
                      },
                  tooltip: 'shoot left',
                  child: Icon(Icons.repeat_one),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  disabledElevation: 0,
                  backgroundColor: _bloc.isShotBakugan()
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPressed: !_bloc.isShotBakugan()
                      ? null
                      : () {
                        setState(() {
                          _bloc.swapBakuCores();
                        });
                      },
                  tooltip: 'swap',
                  child: Icon(Icons.swap_horiz),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  disabledElevation: 0,
                  backgroundColor: _bloc.isShotBakugan()
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPressed: !_bloc.isShotBakugan()
                      ? null
                      : () {
                    setState(() {
                      _bloc.reShootBakugan(TeamPosition.Right);
                    });
                  },
                  tooltip: 'shoot right',
                  child: Icon(Icons.repeat_one),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  disabledElevation: 0,
                  backgroundColor: _bloc.isShotBakugan()
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPressed: !_bloc.isShotBakugan()
                    ? null
                    : () {
//                      setState(() {
//                        _bloc.reShootBakugan(PlayerPosition.Right);
//                      });
                    },
                  tooltip: 'add right',
                  child: Icon(Icons.plus_one),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _bloc.shootBakugans();
                    });
                  },
                  tooltip: 'shoot',
                  child: Icon(Icons.refresh),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildLeftTeam() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        !_bloc.isExistTeamsBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos1)
            ? _buildCoreAddButton(
                TeamPosition.Left, TeamBakuCorePosition.Pos1)
            : _buildTeamBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos1),
        !_bloc.isExistTeamsBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos2)
            ? _buildCoreAddButton(
                TeamPosition.Left, TeamBakuCorePosition.Pos2)
            : _buildTeamBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos2),
        !_bloc.isExistTeamsBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos3)
            ? _buildCoreAddButton(
                TeamPosition.Left, TeamBakuCorePosition.Pos3)
            : _buildTeamBakuCore(
                TeamPosition.Left, TeamBakuCorePosition.Pos3),
      ],
    );
  }

  Widget _buildLeftPlayerGetBakuCore(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${_getBattlePointText(TeamPosition.Left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getShotDamageRateText(TeamPosition.Left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getShotTypeText(TeamPosition.Left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            );
  }

  Widget _buildRightPlayerGetBakuCore(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${_getBattlePointText(TeamPosition.Right)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotDamageRateText(TeamPosition.Right)}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '${_getShotTypeText(TeamPosition.Right)}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }



  Widget _buildRightTeam() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        !_bloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos1)
            ? _buildCoreAddButton(
            TeamPosition.Right, TeamBakuCorePosition.Pos1)
            : _buildTeamBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos1),
        !_bloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos2)
            ? _buildCoreAddButton(
            TeamPosition.Right, TeamBakuCorePosition.Pos2)
            : _buildTeamBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos2),
        !_bloc.isExistTeamsBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos3)
            ? _buildCoreAddButton(
            TeamPosition.Right, TeamBakuCorePosition.Pos3)
            : _buildTeamBakuCore(
            TeamPosition.Right, TeamBakuCorePosition.Pos3),
      ],
    );
  }

  Widget _buildCoreAddButton(TeamPosition playerPosition,
      TeamBakuCorePosition teamBakuCorePosition) {
    return IconButton(
      onPressed: (){
        if (_isLeft(playerPosition) &&
            !_bloc.isSuccessShoot(TeamPosition.Left)) {
            _showCantAddTeamDialog();
            return;
          }
        if (_isRight(playerPosition) &&
            !_bloc.isSuccessShoot(TeamPosition.Right)) {
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
        return AlertDialog(
          title: Text('Error'),
          content: Text('You can not keep an invalid core.')
        );
      },
    );
  }

  Future<bool> _showRemoveConfirmDialog() async {
    var result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to delete the selected baku core?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text('OK'),
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
      case TeamPosition.Right:
        return false;
      case TeamPosition.Left:
        return true;
    }
    throw Error();
  }

  bool _isRight(TeamPosition pos) {
    return !_isLeft(pos);
  }
}
