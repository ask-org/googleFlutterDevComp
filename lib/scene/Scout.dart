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
      className: 'medic', //can move when medic is selected
      carryingLoad: 1,
      lightSource: 2,
      health: 5,
      position: 0);

  String selectedCharacterType = 'scout';

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
                                ? AssetImage(
                                    "assets/images/$selectedCharacterType.png")
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
                    selectedCharacterType = 'scout';
                  });
                  print(selectedCharacterType);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: selectedCharacterType == 'scout'
                          ? Border.all(color: Colors.blue, width: 2.0)
                          : null,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/scout.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacterType = 'warrior';
                  });
                  print(selectedCharacterType);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: selectedCharacterType == 'warrior'
                          ? Border.all(color: Colors.blue, width: 2.0)
                          : null,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/warrior.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacterType = 'medic';
                  });
                  print(selectedCharacterType);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: selectedCharacterType == 'medic'
                          ? Border.all(color: Colors.blue, width: 2.0)
                          : null,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/medic.png"))),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCharacterType = 'collector';
                  });
                  print(selectedCharacterType);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: selectedCharacterType == 'collector'
                          ? Border.all(color: Colors.blue, width: 2.0)
                          : null,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/collector.png"))),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('scout'),
              Text('warrior'),
              Text('medic'),
              Text('collector')
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
                            utils.checkPosition(player.position - 1),
                        characterType: selectedCharacterType);
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
                            player.position - global.cols as int),
                        characterType: selectedCharacterType);
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
                            player.position + global.cols as int),
                        characterType: selectedCharacterType);
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
                            utils.checkPosition(player.position + 1),
                        characterType: selectedCharacterType);
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
