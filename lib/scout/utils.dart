import 'dart:math';

class Utils {
  List<int> obstacles = [];
  List<int> collectables = [];
  List<int> enemies = [];
  int collectableCount = 0;

  int randomNumGenerator(int max) {
    Random number = Random();
    int num = number.nextInt(max);
    return num;
  }

  List<int> allPositions = List.generate(40, (index) => index);

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

  String checkPosition(int position) {
    if (obstacles.contains(position)) {
      return "obstacle";
    } else if (enemies.contains(position)) {
      return "enemy";
    } else if (collectables.contains(position)) {
      return "collectable";
    } else {
      return "empty";
    }
  }

  bool isCollectable(int currentPosition) {
    return collectables.contains(currentPosition);
  }

  bool isObstacle(int currentPosition) {
    return obstacles.contains(currentPosition);
  }

  bool isEnemy(int currentPosition) {
    return enemies.contains(currentPosition);
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
    else if (checkPostion == playerPosition + 1 && playerPosition % cols != 4) {
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
