import 'package:ant_new/router.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.background4,
      body: Center(
        child: Text(
          "Coming Soon!",
          style: TextStyle(
              fontFamily: 'Permanent Marker',
              color: palette.darkPen,
              fontSize: 50),
        ),
      ),
    );
  }
}
