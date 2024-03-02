import 'package:ant_new/router.dart';
import 'package:ant_new/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: palette.backgroundSettings,
      body: Center(
        child: SizedBox(
          height: deviceHeight * 0.5,
          width: deviceWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 55,
                  height: 1,
                ),
              ),
              _gap,
              MyButton(
                  onPressed: () => GoRouter.of(context).go('/'),
                  child: const Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
