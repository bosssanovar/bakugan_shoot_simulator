import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/dialog/ok_cancel_dialog_contents.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';

class AddActionCardDialogContents extends OkCancelDialogContents {

  AddActionCardDialogContents({
    @required this.bloc,
    @required this.teamPosition});

  final MainBloc bloc;
  final TeamPosition teamPosition;
  final _AddActionCardDialogContentsState state
  = _AddActionCardDialogContentsState();

  @override
  _AddActionCardDialogContentsState createState() => state;

  @override
  void onCancel() {
  }

  @override
  void onOk() {
    bloc.addActionCard(
        teamPosition,
        battlePoint: state.battlePoint,
        damageRate: state.damageRate);
  }
}

class _AddActionCardDialogContentsState
    extends State<AddActionCardDialogContents> {
  int battlePoint = 0;
  int damageRate = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        Container(
            color: Colors.grey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BP : ${battlePoint}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                  Text(
                    'こんな感じでダイアログが出せるよ',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                  FlatButton(
                    child: const Text('+100'),
                    onPressed: () {
                      setState(() {
                        battlePoint += 100;
                      });
                    },
                  )
                ],
              ),
            ))
      ],
    );
  }
}