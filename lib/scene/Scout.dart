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
  IconData button1 = Icons.arrow_left;
  IconData button2 = Icons.arrow_upward;
  IconData button3 = Icons.arrow_downward;
  IconData button4 = Icons.arrow_right;
  //edit this later
  int playerPosition = 0;
  List<int> obstacles = [];
  List<int> collectables = [];
  List<int> enemies = [];

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  void moveLeft() {
    setState(() {
      if (playerPosition % cols != 0) {
        playerPosition--;
      }
    });
  }

  bool checkElementAlreadyExists(element) {
    return obstacles.contains(element) ||
        collectables.contains(element) ||
        enemies.contains(element);
  }

  void generateCollectables() {
    while (collectables.length < 4) {
      int collect = randomNumGenerator(rows * cols);
      if (checkElementAlreadyExists(collect)) {
        collectables.add(collect);
      }
    }
  }

  void generateObstacles() {
    while (obstacles.length < 8) {
      int num = randomNumGenerator(rows * cols);
      if (checkElementAlreadyExists(num)) {
        obstacles.add(num);
      }
    }
  }

  void genearateEnemies() {
    while (enemies.length < 3) {
      int num = randomNumGenerator(rows * cols);
      if (checkElementAlreadyExists(num)) {
        enemies.add(num);
      }
    }
  }

  @override
  void initState() {
    // generateCollectables();
    // generateObstacles();
    // genearateEnemies();
    print(collectables);
    print(obstacles);
  }

  void moveRight() {
    setState(() {
      if (playerPosition % cols != cols - 1) {
        playerPosition++;
      }
    });
  }

  void moveUp() {
    setState(() {
      if (playerPosition >= cols) {
        playerPosition -= cols;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (playerPosition < (rows - 1) * cols) {
        playerPosition += cols;
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
                                ? Colors.red
                                : isCollectable(index)
                                    ? Colors.yellow
                                    : isEnemy(index)
                                        ? Colors.blue
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
