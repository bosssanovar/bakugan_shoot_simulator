import 'package:bakugan_shoot_simulator/bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArenaBakuCores extends StatelessWidget {
  const ArenaBakuCores({
    this.bloc,
  });

  final MainBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
