import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:ant_new/style/responsive_game_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameSelectionScreen extends StatefulWidget {
  const GameSelectionScreen({super.key});

  @override
  State<GameSelectionScreen> createState() => _GameSelectionScreenState();
}

class _GameSelectionScreenState extends State<GameSelectionScreen> {
  double imgResource = 0.5;
  double imgDungeon = 0.5;
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
              child: MouseRegion(
                onHover: (_) {
                  setState(() {
                    imgResource = 0.3;
                  });
                },
                onExit: (_) {
                  setState(() {
                    imgResource = 0.5;
                  });
                },
                child: Card(
                  color: palette.background4,
                  child: SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/warrior.png',
                            scale: imgResource,
                          ),
                          const Text(
                            'Manage\nResource',
                            style: TextStyle(
                                fontFamily: 'Permanent Marker', fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            dungeonArea: InkWell(
              onTap: () => GoRouter.of(context).go('/outside'),
              child: MouseRegion(
                onHover: (event) {
                  setState(() {
                    imgDungeon = 0.3;
                  });
                },
                onExit: (event) {
                  setState(() {
                    imgDungeon = 0.5;
                  });
                },
                child: Card(
                  color: palette.backgroundPlaySession,
                  child: SizedBox(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/warrior.png',
                            scale: imgDungeon,
                          ),
                          const Text(
                            'Explore\nOutside',
                            style: TextStyle(
                                fontFamily: 'Permanent Marker', fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            buttonArea: MyButton(
                onPressed: () => GoRouter.of(context).go('/'),
                child: const Text('Back'))));
  }
}
