import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/model/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/model/team/team_baku_core_position.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';

class TeamArea extends StatefulWidget {
  const TeamArea({Key key, this.teamPosition = TeamPosition.left, this.bloc})
      : super(key: key);

  @override
  _TeamAreaState createState() => _TeamAreaState();

  final TeamPosition teamPosition;
  final MainBloc bloc;
}

class _TeamAreaState extends State<TeamArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:
      widget.teamPosition == TeamPosition.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: <Widget>[
        !widget.bloc.isExistTeamsBakuCore(
            widget.teamPosition,
            TeamBakuCorePosition.pos1)
            ? _buildCoreAddButton(TeamBakuCorePosition.pos1)
            : _buildTeamBakuCore(TeamBakuCorePosition.pos1),
        !widget.bloc.isExistTeamsBakuCore(
            widget.teamPosition,
            TeamBakuCorePosition.pos2)
            ? _buildCoreAddButton(TeamBakuCorePosition.pos2)
            : _buildTeamBakuCore(TeamBakuCorePosition.pos2),
        !widget.bloc.isExistTeamsBakuCore(
            widget.teamPosition,
            TeamBakuCorePosition.pos3)
            ? _buildCoreAddButton(TeamBakuCorePosition.pos3)
            : _buildTeamBakuCore(TeamBakuCorePosition.pos3),
      ],
    );
  }

  Widget _buildCoreAddButton(TeamBakuCorePosition position) {
    return IconButton(
      onPressed: () {
        if (!widget.bloc.isSuccessShoot(widget.teamPosition)) {
          _showCantAddTeamDialog();
          return;
        }

        setState(() {
          widget.bloc.storeCores(widget.teamPosition, position);
        });
      },
      icon: Icon(Icons.add_circle_outline),
    );
  }

  Widget _buildTeamBakuCore(TeamBakuCorePosition position) {
    return Row(
      mainAxisAlignment:
      widget.teamPosition == TeamPosition.left
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        widget.teamPosition == TeamPosition.left
            ? _buildRemoveButton(position)
            : Container(),
        Column(
          crossAxisAlignment:
          widget.teamPosition == TeamPosition.left
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: <Widget>[
            Text(_getTeamsDamageRateText(position)),
            Text(_getTeamsBakuCoreTypeText(position)),
          ],
        ),
        widget.teamPosition == TeamPosition.right
            ? _buildRemoveButton(position)
            : Container()
      ],
    );
  }

  Widget _buildRemoveButton(TeamBakuCorePosition position) {
    return IconButton(
      icon: Icon(Icons.remove_circle),
      onPressed: () async {
        await _removeTeamBakuCore(position);
      },
    );
  }

  Future _removeTeamBakuCore(TeamBakuCorePosition position) async {
    if (!(await _showRemoveConfirmDialog())) {
      return;
    }

    setState(() {
      widget.bloc.removeCores(widget.teamPosition, position);
    });
  }

  String _getTeamsDamageRateText(TeamBakuCorePosition position) {
    return 'DR : ${
        widget.bloc.getTeamsDamageRate(widget.teamPosition, position)
    }';
  }

  String _getTeamsBakuCoreTypeText(TeamBakuCorePosition position) {
    final sb = StringBuffer();
    for(final type in widget.bloc
        .getTeamsBakuCoreType(widget.teamPosition, position)){
      sb.write('${type.text}, ');
    }
    return sb.toString();
  }

  void _showCantAddTeamDialog() {
    showDialog<int>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
            title: Text('Error'),
            content: Text('You can not keep an invalid core.'));
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
              'Are you sure you want to delete the selected baku core?'),
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
}