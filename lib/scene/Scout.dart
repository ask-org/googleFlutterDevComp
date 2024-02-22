import 'dart:math';

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
  Player player = Player(
    className: "medic",
    carryingLoad: 2,
    lightSource: 1,
    health: 10,
    position: 0,
  );

  Player scout = Player(
      className: 'scout',
      carryingLoad: 1,
      lightSource: 2,
      health: 5,
      position: 0);

  Player warrior = Player(
      className: 'warrior',
      carryingLoad: 1,
      lightSource: 1,
      health: 15,
      position: 0);

  Player collector = Player(
      className: 'collector',
      carryingLoad: 4,
      lightSource: 1,
      health: 10,
      position: 0);

  String selectedCharacter = 'scout';

  IconData button1 = Icons.arrow_left;
  IconData button2 = Icons.arrow_upward;
  IconData button3 = Icons.arrow_downward;
  IconData button4 = Icons.arrow_right;

  bool checkVisible(checkPostion) {
    return utils.isVisible(
        checkPostion: checkPostion,
        playerPosition: player.position,
        rows: global.rows,
        cols: global.cols);
  }

  //edit this later
  List<int> allPositions = List.generate(40, (index) => index);

  int collectableCount = 0;

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  int checkAvaliablePosition(currentPosition) {
    if (allPositions.contains(currentPosition)) {
      return currentPosition;
    } else {
      return checkAvaliablePosition(randomNumGenerator(allPositions.length));
    }
  }

  @override
  void initState() {
    super.initState();
    utils.generateCollectables(global.totalCollectableCount);
    utils.generateObstacles(global.totalObstacleCount);
    utils.generateEnemies(global.totalEnemyCount);
  }

  isPlayer(int currentPosition) {
    return currentPosition == player.position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(
                  40,
                  (index) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: isPlayer(index)
                                ? const AssetImage("assets/images/player.png")
                                : checkVisible(index)
                                    ? utils.isCollectable(index)
                                        ? const AssetImage(
                                            "assets/images/collectable.png")
                                        : utils.isEnemy(index)
                                            ? const AssetImage(
                                                "assets/images/enemy.png")
                                            : utils.isObstacle(index)
                                                ? const AssetImage(
                                                    "assets/images/obstacles.png")
                                                : const AssetImage(
                                                    "assets/images/ground.png")
                                    : const AssetImage("assets/images/fog.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacter = scout.className;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/player.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacter = collector.className;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/player.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacter = player.className;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/player.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacter = warrior.className;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/player.png"))),
                ),
              ),
            ],
          ),
          Text("Garbage collected $collectableCount"),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    player.moveLeft(
                        intendedPosition:
                            utils.checkPosition(player.position - 1));
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
                    player.moveUp(
                        intendedPosition: utils.checkPosition(
                            player.position - global.cols as int));
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
                    player.moveDown(
                        intendedPosition: utils.checkPosition(
                            player.position + global.cols as int));
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
                    player.moveRight(
                        intendedPosition:
                            utils.checkPosition(player.position + 1));
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
