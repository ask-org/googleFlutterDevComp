import 'dart:math';

import 'package:flutter/material.dart';

class ScoutPage extends StatefulWidget {
  const ScoutPage({super.key});

  @override
  State<ScoutPage> createState() => _ScoutPageState();
}

class _ScoutPageState extends State<ScoutPage> {
  String movement = "";
  int rows = 8;
  int cols = 5;
  int collectableCount = 0;
  IconData button1 = Icons.arrow_left;
  IconData button2 = Icons.arrow_upward;
  IconData button3 = Icons.arrow_downward;
  IconData button4 = Icons.arrow_right;
  //edit this later
  List<int> allPositions = List.generate(40, (index) => index);
  int playerPosition = 0;
  List<int> obstacles = [];
  List<int> collectables = [];
  List<int> enemies = [];

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  void generateCollectables(int count) {
    for (int i = 0; i < count; i++) {
      int index =
          allPositions.removeAt(randomNumGenerator(allPositions.length));
      collectables.add(index);
    }
  }

  void generateObstacles(int count) {
    for (int i = 0; i < count; i++) {
      int index =
          allPositions.removeAt(randomNumGenerator(allPositions.length));
      obstacles.add(index);
    }
  }

  void generateEnemies(int count) {
    for (int i = 0; i < count; i++) {
      int index =
          allPositions.removeAt(randomNumGenerator(allPositions.length));
      enemies.add(index);
    }
  }

  @override
  void initState() {
    super.initState();
    generateCollectables(4);
    generateObstacles(11);
    generateEnemies(3);
  }

  void moveLeft() {
    int newPosition = playerPosition - 1;
    setState(() {
      if (playerPosition % cols != 0 &&
          !isObstacle(newPosition) &&
          !isEnemy(newPosition)) {
        playerPosition--;
        if (isCollectable(newPosition)) {
          collectableCount++;
          collectables.remove(newPosition);
        }
      }
    });
  }

  void moveRight() {
    int newPosition = playerPosition + 1;
    setState(() {
      if (playerPosition % cols != cols - 1 &&
          !isObstacle(newPosition) &&
          !isEnemy(newPosition)) {
        playerPosition++;
      }
      if (isCollectable(newPosition)) {
        collectableCount++;
        collectables.remove(newPosition);
      }
    });
  }

  void moveUp() {
    int newPosition = playerPosition - cols;
    setState(() {
      if (playerPosition >= cols &&
          !isObstacle(newPosition) &&
          !isEnemy(newPosition)) {
        playerPosition -= cols;
      }
      if (isCollectable(newPosition)) {
        collectableCount++;
        collectables.remove(newPosition);
      }
    });
  }

  void moveDown() {
    int newPosition = playerPosition + cols;
    setState(() {
      if (playerPosition < (rows - 1) * cols &&
          !isObstacle(newPosition) &&
          !isEnemy(newPosition)) {
        playerPosition += cols;
      }
      if (isCollectable(newPosition)) {
        collectableCount++;
        collectables.remove(newPosition);
      }
    });
  }

  isCollectable(int currentPosition) {
    return collectables.contains(currentPosition);
  }

  isObstacle(int currentPosition) {
    return obstacles.contains(currentPosition);
  }

  isEnemy(int currentPosition) {
    return enemies.contains(currentPosition);
  }

  isPlayer(int currentPosition) {
    return currentPosition == playerPosition;
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
                  rows * cols,
                  (index) => Container(
                        decoration: BoxDecoration(
                            color: isPlayer(index)
                                // isCollectable() : isObstacle(currne): isEnemy(): isPlayer()
                                ? Colors.blue
                                : isCollectable(index)
                                    ? Colors.grey
                                    : isEnemy(index)
                                        ? Colors.red
                                        : isObstacle(index)
                                            ? Colors.black
                                            : Colors.white),
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      )),
            ),
          ),
          Text("Garbage collected $collectableCount"),
          Wrap(
            children: [
              IconButton(
                  onPressed: () {
                    moveLeft();
                  },
                  icon: Icon(
                    button1,
                    size: 80,
                  )),
              IconButton(
                  onPressed: () {
                    moveUp();
                  },
                  icon: Icon(
                    button2,
                    size: 80,
                  )),
              IconButton(
                  onPressed: () {
                    moveDown();
                  },
                  icon: Icon(
                    button3,
                    size: 80,
                  )),
              IconButton(
                  onPressed: () {
                    moveRight();
                  },
                  icon: Icon(
                    button4,
                    size: 80,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
