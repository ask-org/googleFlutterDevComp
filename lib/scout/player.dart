import "package:ant_new/scout/global.dart";

class Player {
  String className;
  int health;
  int position;
  int carryingLoad;
  int lightSource;
  List<int> obstacles = [];

  Global global = Global();

  Player({
    required this.className,
    required this.carryingLoad,
    required this.lightSource,
    required this.health,
    required this.position,
  });

  void setObstacles(List<int> newObstacles) {
    obstacles = newObstacles;
  }

  void moveLeft({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }

    if (position % global.cols != 0) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        position = position - 1;
      }
    }
  }

  void moveRight({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position % global.cols != global.cols - 1) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        position = position + 1;
      }
    }
  }

  void moveUp({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position >= global.cols) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        position = (position - global.cols) as int;
      }
    }
  }

  void moveDown({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position < (global.rows - 1) * global.cols) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        position = (position + global.cols) as int;
      }
    }
  }

  // TODO: should delete the collectable if collected.
  int collect(int existing) {
    if (carryingLoad == 0) {
      print("Cannot carry more weight");
      return existing;
    } else {
      carryingLoad--;
      return existing++;
    }
  }

  // TODO: Implement attack method
  void attack() {
    print("Attacking");
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
