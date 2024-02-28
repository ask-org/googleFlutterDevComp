import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:ant_new/style/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  Palette palette = Palette();
  static const _gap = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -0.1,
              child: const Text(
                'Ant Quest',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 75,
                  height: 1,
                ),
              ),
            ),
            Image.asset(
              'assets/images/warrior.png',
              scale: 0.2,
            )
          ],
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () => GoRouter.of(context).push('/play'),
              child: const Text('Play'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/manage'),
              child: const Text('Manage'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/store'),
              child: const Text('store'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: const Text('Settings'),
            ),
            _gap,
          ],
        ),
      ),
    );
  }
}
