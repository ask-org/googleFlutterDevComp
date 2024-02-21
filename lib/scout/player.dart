import "package:ant_new/scout/global.dart";

class Player {
  String className;
  int health;
  int position;
  int carryingLoad;
  int lightSource;

  Player({
    required this.className,
    required this.carryingLoad,
    required this.lightSource,
    required this.health,
    required this.position,
  });

  void moveLeft() {
    if (position % global.cols != 0) {
      position = position - 1;
    }
  }

  void moveRight() {
    if (position % global.cols != global.cols - 1) {
      position = position + 1;
    }
  }

  void moveUp() {
    if (position >= global.cols) {
      position = position - global.cols;
    }
  }

  void moveDown() {
    if (position < (global.rows - 1) * global.cols) {
      position = position + global.cols;
    }
  }

  // void move(
  //     {required int newPosition,
  //     required int newCarryingLoad,
  //     required int newLightSource,
  //     required int newHealth}) {
  //   position = newPosition;
  //   carryingLoad = newCarryingLoad;
  //   lightSource = newLightSource;
  //   health = newHealth;
  // }
}
