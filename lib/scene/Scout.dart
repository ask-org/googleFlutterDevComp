import 'dart:math';
import 'package:ant_new/scout/enemy.dart';
import 'package:ant_new/scout/global.dart';
import 'package:ant_new/scout/player.dart';
import 'package:ant_new/scout/utils.dart';
import 'package:ant_new/style/responsive_dungeon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class ScoutPage extends StatefulWidget {
  const ScoutPage({super.key});

  @override
  State<ScoutPage> createState() => _ScoutPageState();
}

class _ScoutPageState extends State<ScoutPage> {
  Global global = Global();
  Utils utils = Utils();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playDungeonOST() {
    _audioPlayer.stop();
    _audioPlayer.setVolume(0.3);
    _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer
        .setAudioSource(AudioSource.asset(
            'assets/audio/091_Heartbound_OST_Windup_Wonders.mp3'))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      debugPrint("Error in audio scout $error");
    });
    _audioPlayer.play();
  }

  List<Player> players = [];
  dynamic selectedPlayer;

  IconData button1 = Icons.arrow_left;
  IconData button2 = Icons.arrow_upward;
  IconData button3 = Icons.arrow_downward;
  IconData button4 = Icons.arrow_right;

  void changePlayer(Player activePlayer) {
    setState(() {
      selectedPlayer = activePlayer;
    });
  }

  bool checkVisible(checkPostion) {
    return utils.isVisible(
        checkPostion: checkPostion,
        playerPosition: selectedPlayer.position,
        rows: global.rows,
        cols: global.cols);
  }

  @override
  void initState() {
    super.initState();
    utils.repaint();
    for (int i = 0; i < 4; i++) {
      players.add(
          Player(className: 'scout', lightSource: 1, health: 5, position: 0));
    }
    selectedPlayer = players[0];
    utils.generateCollectables(global.totalCollectableCount);
    utils.generateObstacles(global.totalObstacleCount);
    // utils.generateEnemies(1);
    utils.generateEnemies(global.totalEnemyCount);
    playDungeonOST();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  int collectableCount = 0;

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  int checkAvaliablePosition(currentPosition) {
    if (utils.checkPositon(currentPosition)) {
      return currentPosition;
    } else {
      return checkAvaliablePosition(
          randomNumGenerator(Utils.allPositions.length));
    }
  }

  bool isPlayer(int currentPosition) {
    for (int i = 0; i < players.length; i++) {
      if (currentPosition == players[i].position) {
        return true;
      }
    }
    return false;
  }

  chooseRandomEnemy() {
    Enemy chosenRandomEnemy =
        Utils.enemies[randomNumGenerator(Utils.enemies.length)];
    chosenRandomEnemy.randomMove();
    // for (int i = 0; i < Utils.enemies.length; i++) {
    //   Utils.enemies[i].randomMove();
    // }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ResponsiveDungeon(
      leftResourceArea: Wrap(
        children: [
          IconButton(
              onPressed: () => GoRouter.of(context).go('/play'),
              icon: const Icon(
                Icons.arrow_back,
                size: 60,
              )),
          Image.asset(
            'assets/images/block.png',
            scale: 1.5,
          ),
          const Text(
            '0',
            style: TextStyle(fontSize: 40),
          ),
          Image.asset(
            'assets/images/block.png',
            scale: 1.5,
          ),
          const Text(
            '0',
            style: TextStyle(fontSize: 40),
          ),
          Image.asset(
            'assets/images/block.png',
            scale: 1.5,
          ),
          const Text(
            '0',
            style: TextStyle(fontSize: 40),
          ),
          Image.asset(
            'assets/images/block.png',
            scale: 1.5,
          ),
          const Text(
            '0',
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      squarishMainArea: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: global.cols,
              children: List.generate(
                  global.totalCells,
                  (index) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: isPlayer(index)
                                ? const AssetImage("assets/images/warrior.png")
                                // : checkVisible(index)
                                : utils.isCollectable(index)
                                    ? const AssetImage(
                                        "assets/images/garbage.png")
                                    : utils.isEnemy(index)
                                        ? const AssetImage(
                                            "assets/images/enemy.png")
                                        : utils.isObstacle(index)
                                            ? const AssetImage(
                                                "assets/images/block.png")
                                            : const AssetImage(
                                                "assets/images/ground.png"),
                            // : const AssetImage("assets/images/fog.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
            ),
          ),
          SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: players
                    .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              changePlayer(e);
                            });
                          },
                          child: Container(
                            width: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/warrior.png"))),
                          ),
                        ))
                    .toList(),
              )),
        ],
      ),
      rightControllerArea: Center(
        child: Wrap(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedPlayer.moveLeft(
                      intendedPosition:
                          utils.checkField(selectedPlayer.position - 1));
                  chooseRandomEnemy();
                });
              },
              icon: Icon(
                button1,
              ),
              iconSize: 60,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedPlayer.moveUp(
                      intendedPosition: utils.checkField(
                          selectedPlayer.position - global.cols as int));
                  chooseRandomEnemy();
                });
              },
              icon: Icon(
                button2,
              ),
              iconSize: 60,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedPlayer.moveDown(
                      intendedPosition: utils.checkField(
                          selectedPlayer.position + global.cols as int));
                  chooseRandomEnemy();
                });
              },
              icon: Icon(
                button3,
              ),
              iconSize: 60,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedPlayer.moveRight(
                      intendedPosition:
                          utils.checkField(selectedPlayer.position + 1));
                  chooseRandomEnemy();
                });
              },
              icon: Icon(
                button4,
              ),
              iconSize: 60,
            ),
          ],
        ),
      ),
    ));
  }
}
