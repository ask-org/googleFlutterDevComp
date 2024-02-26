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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.backgroundSettings,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Settings Page'),
            MyButton(
                onPressed: () => GoRouter.of(context).go('/'),
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
