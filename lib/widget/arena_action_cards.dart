import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArenaActionCards extends StatelessWidget {
  const ArenaActionCards({
    @required this.bloc,
  });

  final MainBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
