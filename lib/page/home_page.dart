import 'dart:io';

import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:bakugan_shoot_simulator/widget/background.dart';
import 'package:bakugan_shoot_simulator/widget/current_area.dart';
import 'package:bakugan_shoot_simulator/widget/footer_buttons.dart';
import 'package:bakugan_shoot_simulator/widget/header_buttons.dart';
import 'package:bakugan_shoot_simulator/widget/team_area.dart';
import 'package:bakugan_shoot_simulator/widget/versus_area.dart';
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
          const Background(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: _buildTeam(TeamPosition.left)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60, left: 40),
                    child: _buildCurrentBakuCore(context, TeamPosition.left),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, right: 40),
                    child: _buildCurrentBakuCore(context, TeamPosition.right),
                  ),
                ),
                Expanded(child: _buildTeam(TeamPosition.right)),
              ],
            ),
          ),
          _buildButtons(),
          const VersusArea(),
        ],
      ),
    );
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
      bloc: _bloc,
      onUpdate: (func) {
        setState(() {
          func();
        });
      },
    );
  }

  Widget _buildFooterButtons() {
    return FooterButtons(
      bloc: _bloc,
      onUpdate: (func) {
        setState(() {
          func();
        });
      },
    );
  }

  Widget _buildTeam(TeamPosition teamPosition) {
    return TeamArea(
      teamPosition: teamPosition,
      bloc: _bloc,
      onUpdate: (func) {
        setState(() {
          func();
        });
      },
    );
  }

  Widget _buildCurrentBakuCore(
      BuildContext context, TeamPosition teamPosition) {
    return CurrentArea(
      position: teamPosition,
      bloc: _bloc,
    );
  }
}
