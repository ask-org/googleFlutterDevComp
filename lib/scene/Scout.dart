import 'dart:math';
import 'package:ant_new/scout/enemy.dart';
import 'package:ant_new/scout/global.dart';
import 'package:ant_new/scout/player.dart';
import 'package:ant_new/scout/utils.dart';
import 'package:ant_new/style/responsive_dungeon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoutPage extends StatefulWidget {
  const ScoutPage({super.key});

  @override
  State<ScoutPage> createState() => _ScoutPageState();
}

class _ScoutPageState extends State<ScoutPage> {
  Global global = Global();
  Utils utils = Utils();

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
    initializePlayer();
    selectedPlayer = players.isNotEmpty ? players[0] : null;
    utils.generateCollectables(global.totalCollectableCount);
    utils.generateObstacles(global.totalObstacleCount,
        excludeIndices: [0, 1, 7, 8, 9]);
    // utils.generateEnemies(1);
    utils.generateEnemies(global.totalEnemyCount);
  }

  List<Map<String, dynamic>> playerInfo = [
    {
      "imagePath": "assets/images/scout.png",
      "className": "scout",
      "lightSource": 2,
      "health": 5,
      "position": 0
    },
    {
      "imagePath": "assets/images/warrior.png",
      "className": "warrior",
      "lightSource": 1,
      "health": 8,
      "position": 0
    },
    {
      "imagePath": "assets/images/player.png",
      "className": "player",
      "lightSource": 1,
      "health": 6,
      "position": 0
    },
    {
      "imagePath": "assets/images/medic.png",
      "className": "medic",
      "lightSource": 1,
      "health": 4,
      "position": 0
    },
  ];

  void initializePlayer() {
    for (var info in playerInfo) {
      players.add(Player(
          imagePath: info["imagePath"],
          className: info["className"],
          lightSource: info["lightSource"],
          health: info["health"],
          position: info["position"]));
    }
    debugPrint("$playerInfo");
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
              children: List.generate(global.totalCells, (index) {
                Player? currentPlayer;
                for (final player in players) {
                  if (player.position == index) {
                    currentPlayer = player;
                    break;
                  }
                }
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isPlayer(index)
                          ? AssetImage(currentPlayer!.imagePath)
                          // : checkVisible(index)
                          : utils.isCollectable(index)
                              ? const AssetImage("assets/images/garbage.png")
                              : utils.isEnemy(index)
                                  ? const AssetImage("assets/images/enemy.png")
                                  : utils.isObstacle(index)
                                      ? const AssetImage(
                                          "assets/images/block.png")
                                      : const AssetImage(
                                          "assets/images/ground.png"),
                      // : const AssetImage("assets/images/fog.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: players
                    .map((player) => InkWell(
                          onTap: () {
                            setState(() {
                              changePlayer(player);
                            });
                          },
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        playerInfo[players.indexOf(player)]
                                            ["imagePath"]))),
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
