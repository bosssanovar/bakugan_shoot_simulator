import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}