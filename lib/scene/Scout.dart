import 'dart:math';

// import 'package:ant_new/scout/collectible.dart';
import 'package:ant_new/scout/global.dart';
import 'package:ant_new/scout/player.dart';
import 'package:ant_new/scout/utils.dart';
import 'package:flutter/material.dart';

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

  bool checkVisible(checkPostion) {
    return utils.isVisible(
        checkPostion: checkPostion,
        playerPosition: selectedPlayer.position,
        rows: global.rows,
        cols: global.cols);
  }

  void changePlayer(Player activePlayer) {
    setState(() {
      selectedPlayer = activePlayer;
    });
  }

  // choseRandomEnemy() {
  //   utils.
  // }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      players.add(
          Player(className: 'scout', lightSource: 1, health: 5, position: 0));
    }
    selectedPlayer = players[0];
    utils.generateCollectables(global.totalCollectableCount);
    utils.generateObstacles(global.totalObstacleCount);
    utils.generateEnemies(global.totalEnemyCount);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              width: 500,
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: players
                    .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              changePlayer(e);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: 50,

                              width: 100,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/warrior.png"))),
                            ),
                          ),
                        ))
                    .toList(),
              )),
          Text("Garbage collected $collectableCount"),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedPlayer.moveLeft(
                        intendedPosition:
                            utils.checkField(selectedPlayer.position - 1));
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
                  });
                },
                icon: Icon(
                  button4,
                ),
                iconSize: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
