import 'dart:math';

import 'package:ant_new/scout/collectible.dart';
import 'package:ant_new/scout/enemy.dart';
import 'package:ant_new/scout/global.dart';

class Utils {
  List<int> obstacles = [];
  static List<Collectible> collectables = [];
  static List<Enemy> enemies = [];
  int collectableCount = 0;
  static List<int> allPositions = [];

  Global global = Global();
  // List<dynamic> Collectibles = [];

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  Utils() {
    allPositions = List.generate(global.totalCells, (index) => index);
  }

  clearAllPos() {
    allPositions.clear();
  }

  checkPositon(int pos) {
    allPositions.contains(pos);
  }

  removeFromAllPostion(int pos) {
    allPositions.remove(pos);
  }

  addToAllPostion(int pos) {
    allPositions.add(pos);
  }

  void generateCollectables(int count) {
    for (int i = 0; i < count; i++) {
      int index =
          allPositions.removeAt(randomNumGenerator(allPositions.length));
      Collectible collectible = Collectible(
          name: "name",
          description: "description",
          position: index,
          image: "image",
          quantity: 1);
      collectables.add(collectible);
      // collectables.add(collectible);
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
      Enemy enemy = Enemy(
          name: 'name',
          health: 10,
          experiencePoints: 5,
          gold: 5,
          damagePoint: 10,
          position: index);
      enemies.add(enemy);
    }
  }

  String checkField(int position) {
    if (obstacles.contains(position)) {
      return "obstacle";
    } else if (enemies.contains(position)) {
      return "enemy";
    } else if (isCollectable(position)) {
      return "collectable";
    } else {
      return "empty";
    }
  }

  bool isCollectable(int currentPosition) {
    for (int i = 0; i < collectables.length; i++) {
      if (collectables[i].position == currentPosition) {
        return true;
      }
    }
    return false;
  }

  bool isObstacle(int currentPosition) {
    return obstacles.contains(currentPosition);
  }

  bool isEnemy(int currentPosition) {
    for (int i = 0; i < enemies.length; i++) {
      if (enemies[i].position == currentPosition) {
        return true;
      }
    }
    return false;
  }

  bool isVisible(
      {required int checkPostion,
      required int playerPosition,
      required int rows,
      required int cols}) {
    if (checkPostion == playerPosition) {
      return true;
    }
    // check left
    else if (checkPostion == playerPosition - 1 && playerPosition % cols != 0) {
      return true;
    }
    // check right
    else if (checkPostion == playerPosition + 1 &&
        playerPosition % cols != cols - 1) {
      return true;
    }
    // check up
    else if (checkPostion == playerPosition - cols && playerPosition >= cols) {
      return true;
    }
    // check down
    else if (checkPostion == playerPosition + cols &&
        playerPosition < (rows - 1) * cols) {
      return true;
    } else {
      return false;
    }
  }
}
