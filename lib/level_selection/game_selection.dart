import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameSelectionScreen extends StatefulWidget {
  const GameSelectionScreen({super.key});

  @override
  State<GameSelectionScreen> createState() => _GameSelectionScreenState();
}

class _GameSelectionScreenState extends State<GameSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    Palette palette = Palette();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Choose Mode',
                    style:
                        TextStyle(fontFamily: 'Permanent Marker', fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
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
                  InkWell(
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
                ],
              ),
            ],
          ),
          MyButton(
              onPressed: () => GoRouter.of(context).go('/'),
              child: const Text('Back'))
        ],
      ),
    );
  }
}
