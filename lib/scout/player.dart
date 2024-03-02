import "package:ant_new/scout/global.dart";
import "package:ant_new/scout/utils.dart";

class Player {
  String className;
  String imagePath;
  int health;
  int position;
  int lightSource;

  Global global = Global();
  Utils utils = Utils();

  Player({
    required this.imagePath,
    required this.className,
    required this.lightSource,
    required this.health,
    required this.position,
  });

  // Collectible? findCollectible(int postion) {
  //   for (int i = 0; i < utils.collectables.length; i++) {
  //     if (utils.collectables[i].position == postion) {
  //       return utils.collectables[i];
  //     }
  //   }
  //   return null;
  // }

  void deleteCollectibles() {
    for (int i = 0; i < Utils.collectables.length; i++) {
      if (Utils.collectables[i].position == position) {
        Utils.collectables.removeAt(i);
        utils.addToAllPostion(position);
      }
    }
  }

  // Collectible? findCollectible(int postion) {
  //   for (int i = 0; i < utils.collectables.length; i++) {
  //     if (utils.collectables[i].position == postion) {
  //       return utils.collectables[i];
  //     }
  //   }
  //   return null;
  // }

  _movePlayer(int newPos, String field) {
    position = newPos;
    utils.addToAllPostion(newPos);
    utils.removeFromAllPostion(position);
    if (field == 'collectable') {
      deleteCollectibles();
    }
  }

  void moveLeft({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }

    if (position % global.cols != 0) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        _movePlayer(position - 1, intendedPosition);
      }
    }
  }

  void moveRight({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position % global.cols != global.cols - 1) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        _movePlayer(position + 1, intendedPosition);
      }
    }
  }

  void moveUp({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position >= global.cols) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        _movePlayer(position - global.cols as int, intendedPosition);
      }
    }
  }

  void moveDown({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }
    if (position < (global.rows - 1) * global.cols) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        _movePlayer(position + global.cols as int, intendedPosition);
      }
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
