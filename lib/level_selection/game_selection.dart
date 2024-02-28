import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:ant_new/style/responsive_game_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Palette palette = Palette();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: palette.backgroundLevelSelection,
        body: ResponsiveGameMenu(
            headArea: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Choose Mode',
                  style:
                      TextStyle(fontFamily: 'Permanent Marker', fontSize: 50),
                ),
              ),
            ),
            cardArea: InkWell(
              onTap: () => GoRouter.of(context).go('/card'),
              child: Card(
                color: palette.background4,
                child: SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.4,
                    child: const Center(
                        child: Text(
                      'Manage\nResource',
                      style: TextStyle(
                          fontFamily: 'Permanent Marker', fontSize: 20),
                    ))),
              ),
            ),
            dungeonArea: InkWell(
              onTap: () => GoRouter.of(context).go('/outside'),
              child: Card(
                color: palette.backgroundPlaySession,
                child: SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.4,
                    child: const Center(
                        child: Text(
                      'Explore\nOutside',
                      style: TextStyle(
                          fontFamily: 'Permanent Marker', fontSize: 20),
                    ))),
              ),
            ),
            buttonArea: MyButton(
                onPressed: () => GoRouter.of(context).go('/'),
                child: const Text('Back'))));
  }
}
