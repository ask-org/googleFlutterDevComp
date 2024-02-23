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

  // Player player1 = Player(
  //     className: 'medic', //can move when medic is selected
  //     lightSource: 2,
  //     health: 5,
  //     position: 0);

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
    if (utils.allPositions.contains(currentPosition)) {
      return currentPosition;
    } else {
      return checkAvaliablePosition(
          randomNumGenerator(utils.allPositions.length));
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
                                                    "assets/images/block.png")
                                                : const AssetImage(
                                                    "assets/images/ground.png")
                                    : const AssetImage("assets/images/fog.png"),
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
                                          "assets/images/scout.png"))),
                            ),
                          ),
                        ))
                    .toList(),
              )),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         // setState(() {
          //         //   selectedCharacterType = 'scout';
          //         // });
          //         // print(selectedCharacterType);
          //       },
          //       child: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //             image: const DecorationImage(
          //                 fit: BoxFit.fill,
          //                 image: AssetImage("assets/images/scout.png"))),
          //       ),
          //     ),
          //     InkWell(
          //       // onTap: () {
          //       //   setState(() {
          //       //     selectedCharacterType = 'warrior';
          //       //   });
          //       //   print(selectedCharacterType);
          //       // },
          //       child: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //             image: const DecorationImage(
          //                 fit: BoxFit.fill,
          //                 image: AssetImage("assets/images/warrior.png"))),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         // setState(() {
          //         //   selectedCharacterType = 'medic';
          //         // });
          //         // print(selectedCharacterType);
          //       },
          //       child: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //             image: const DecorationImage(
          //                 fit: BoxFit.fill,
          //                 image: AssetImage("assets/images/medic.png"))),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         setState(() {
          //           changePlayer(players[2]);
          //         });
          //       },
          //       child: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 fit: BoxFit.fill,
          //                 image: AssetImage("assets/images/collector.png"))),
          //       ),
          //     ),
          //   ],
          // ),
          // // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text('scout'),
          //     Text('warrior'),
          //     Text('medic'),
          //     Text('collector')
          //   ],
          // ),
          Text("Garbage collected $collectableCount"),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedPlayer.moveLeft(
                        intendedPosition:
                            utils.checkPosition(selectedPlayer.position - 1));
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
                        intendedPosition: utils.checkPosition(
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
                        intendedPosition: utils.checkPosition(
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
                            utils.checkPosition(selectedPlayer.position + 1));
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
