import 'package:flutter/material.dart';

class TeamArea extends StatefulWidget {
  TeamArea(
      {Key key,
      this.isLeft = false,
      this.isShotSuccess = false,
      TeamAreaElement team1 = null,
      TeamAreaElement team2 = null,
      TeamAreaElement team3 = null,
      this.onStoreBakuCore,
      this.onRemoveBakuCore})
      : super(key: key) {
    elements[BakuCorePosition.pos1] = team1;
    elements[BakuCorePosition.pos2] = team2;
    elements[BakuCorePosition.pos3] = team3;
    if (onStoreBakuCore == null) {
      throw ArgumentError();
    }
    if (onRemoveBakuCore == null) {
      throw ArgumentError();
    }
  }

  @override
  _TeamAreaState createState() => _TeamAreaState();

  final bool isLeft;
  final bool isShotSuccess;
  Map<BakuCorePosition, TeamAreaElement> elements =
      <BakuCorePosition, TeamAreaElement>{};
  final Function(BakuCorePosition) onStoreBakuCore;
  final Function(BakuCorePosition) onRemoveBakuCore;
}

class _TeamAreaState extends State<TeamArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:
          widget.isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: <Widget>[
        !_isExistTeamsBakuCore(BakuCorePosition.pos1)
            ? _buildCoreAddButton(BakuCorePosition.pos1)
            : _buildTeamBakuCore(BakuCorePosition.pos1),
        !_isExistTeamsBakuCore(BakuCorePosition.pos2)
            ? _buildCoreAddButton(BakuCorePosition.pos2)
            : _buildTeamBakuCore(BakuCorePosition.pos2),
        !_isExistTeamsBakuCore(BakuCorePosition.pos3)
            ? _buildCoreAddButton(BakuCorePosition.pos3)
            : _buildTeamBakuCore(BakuCorePosition.pos3),
      ],
    );
  }

  bool _isExistTeamsBakuCore(BakuCorePosition position) {
    if (widget.elements[position] == null) {
      return false;
    }
    return true;
  }

  Widget _buildCoreAddButton(BakuCorePosition position) {
    return IconButton(
      onPressed: () {
        if (!widget.isShotSuccess) {
          _showCantAddTeamDialog();
          return;
        }

        widget.onStoreBakuCore(position);
      },
      icon: Icon(Icons.add_circle_outline),
    );
  }

  Widget _buildTeamBakuCore(BakuCorePosition position) {
    return Row(
      mainAxisAlignment:
          widget.isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        widget.isLeft ? _buildRemoveButton(position) : Container(),
        Column(
          crossAxisAlignment:
              widget.isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: <Widget>[
            Text(_getTeamsDamageRateText(position)),
            Text(_getTeamsBakuCoreTypeText(position)),
          ],
        ),
        !widget.isLeft ? _buildRemoveButton(position) : Container()
      ],
    );
  }

  Widget _buildRemoveButton(BakuCorePosition position) {
    return IconButton(
      icon: Icon(Icons.remove_circle),
      onPressed: () async {
        await _removeTeamBakuCore(position);
      },
    );
  }

  Future _removeTeamBakuCore(BakuCorePosition position) async {
    if (!(await _showRemoveConfirmDialog())) {
      return;
    }

    widget.onRemoveBakuCore(position);
  }

  String _getTeamsDamageRateText(BakuCorePosition position) {
    return 'DR : ${widget.elements[position].damageRate}';
  }

  String _getTeamsBakuCoreTypeText(BakuCorePosition position) {
    return '${widget.elements[position].bakuCoreType}';
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

class TeamAreaElement {
  const TeamAreaElement({
    this.damageRate,
    this.bakuCoreType,
  });

  final int damageRate;
  final String bakuCoreType;
}

enum BakuCorePosition { pos1, pos2, pos3 }
