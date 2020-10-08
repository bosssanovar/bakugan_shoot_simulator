import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:bakugan_shoot_simulator/dialog/add_action_card_dialog_contents.dart';
import 'package:bakugan_shoot_simulator/model/team/team_position.dart';
import 'package:flutter/material.dart';

import '../dialog/ok_cancel_dialog.dart';

class ArenaActionCards extends StatefulWidget {
  const ArenaActionCards({@required this.bloc, @required this.position});

  final MainBloc bloc;
  final TeamPosition position;

  @override
  _ArenaActionCardsState createState() => _ArenaActionCardsState();
}

class _ArenaActionCardsState extends State<ArenaActionCards> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.position == TeamPosition.left
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: _buildAddButton(context),
              )
            : Container(),
        _buildComputedParam(context),
        widget.position == TeamPosition.right
            ? Padding(
                padding: const EdgeInsets.only(left: 10),
                child: _buildAddButton(context),
              )
            : Container(),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await OkCancelDialog(
          context,
          contents: AddActionCardDialogContents(
            bloc: widget.bloc,
            teamPosition: widget.position,
          ),
        ).showCustomDialog();

        setState(() {});
      },
      child: CustomPaint(
        painter: _ActionCardsButtonPainter(),
        child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            child: Text(
              '+',
              style: Theme.of(context).textTheme.headline6,
            )),
      ),
    );
  }

  GestureDetector _buildComputedParam(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: _ActionCardsPainter(),
        child: Center(
          child: SizedBox(
            height: 70,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'DR : ${widget.bloc.getActionCardDamageRate(widget.position)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  'BP : ${widget.bloc.getActionCardBattlePointTotal(widget.position)}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class _ActionCardsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    const height = 30;
    const width = 65;

    var paint = Paint()
      ..color = const Color.fromARGB(0x77, 0xff, 0x00, 0x00);
    var path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)
      ..lineTo(x0 + width, y0 + height)
      ..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ActionCardsButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final x0 = size.width / 2;
    final y0 = size.height / 2;

    const height = 30;
    const width = 20;

    var paint = Paint()
      ..color = const Color.fromARGB(0x77, 0xff, 0x00, 0x00);
    var path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    path = Path()
      ..moveTo(x0 - width, y0 - height)
      ..lineTo(x0 - width, y0 + height)..lineTo(
          x0 + width, y0 + height)..lineTo(x0 + width, y0 - height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
