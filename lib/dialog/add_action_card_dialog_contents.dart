import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/dialog/ok_cancel_dialog_contents.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    if (state.battlePoint == 0 && state.damageRate == 0) {
      return;
    }

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
    const h = 230.0;
    return Stack(
      children: <Widget>[
        Container(
          height: h,
          color: Colors.grey,
        ),
        Container(
            height: h,
            alignment: Alignment.center,
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildDamageRate(),
                  const SizedBox(
                    width: 50,
                  ),
                  _buildBattlePoint(),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildDamageRate() {
    return Column(
      children: <Widget>[
        _buildDamageRateDisplay(),
        const SizedBox(
          height: 10,
        ),
        _buildDamageRateInput(),
      ],
    );
  }

  Widget _buildDamageRateInput() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            myRaisedButton('+1', () {
              damageRate += 1;
            }),
            const SizedBox(width: 10),
            myRaisedButton('+5', () {
              damageRate += 5;
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            myRaisedButton('-1', () {
              damageRate -= 1;
            }),
            const SizedBox(width: 10),
            myRaisedButton('-5', () {
              damageRate -= 5;
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildDamageRateDisplay() {
    return Column(
      children: <Widget>[
        Text(
          'DR:$damageRate',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }

  Widget _buildBattlePoint() {
    return Column(
      children: <Widget>[
        _buildBattlePointDisplay(),
        const SizedBox(
          height: 10,
        ),
        _buildBattlePointInput(),
      ],
    );
  }

  Widget _buildBattlePointInput() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            myRaisedButton('+50', () {
              battlePoint += 50;
            }),
            const SizedBox(width: 10),
            myRaisedButton('+100', () {
              battlePoint += 100;
            }),
            const SizedBox(width: 10),
            myRaisedButton('+500', () {
              battlePoint += 500;
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            myRaisedButton('-50', () {
              battlePoint -= 50;
            }),
            const SizedBox(width: 10),
            myRaisedButton('-100', () {
              battlePoint -= 100;
            }),
            const SizedBox(width: 10),
            myRaisedButton('-500', () {
              battlePoint -= 500;
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildBattlePointDisplay() {
    return Column(
      children: <Widget>[
        Text(
          'BP:$battlePoint',
          style: Theme
              .of(context)
              .textTheme
              .headline5,
        ),
      ],
    );
  }

  Widget myRaisedButton(String text, Function onPressed) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        child: Text(
          text,
          style: Theme
              .of(context)
              .textTheme.headline5,
        ),
        color: Colors.blue,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          setState(() {
            onPressed();
          });
        },
      ),
    );
  }
}