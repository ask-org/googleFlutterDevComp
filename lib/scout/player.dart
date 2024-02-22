import "package:ant_new/scout/global.dart";
import "package:ant_new/scout/utils.dart";

class Player {
  String className;
  int health;
  int position;
  int lightSource;

  Global global = Global();
  Utils utils = Utils();

  Player({
    required this.className,
    required this.lightSource,
    required this.health,
    required this.position,
  });

  void deleteCollectibles() {
    for (int i = 0; i < Utils.collectables.length; i++) {
      if (Utils.collectables[i].position == position) {
        var data = Utils.collectables.removeAt(i);
        global.fertilizerCount = data.quantity + global.fertilizer;
        print(global.fertilizer);
      }
    }
  }

  void moveLeft({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }

    if (position % global.cols != 0) {
      if (intendedPosition != 'obstacle' && intendedPosition != 'enemy') {
        position = position - 1;
        if (intendedPosition == 'collectable') {
          deleteCollectibles();
        }
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
        if (intendedPosition == 'collectable') {
          deleteCollectibles();
        }
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
        if (intendedPosition == 'collectable') {
          deleteCollectibles();
        }
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
        if (intendedPosition == 'collectable') {
          deleteCollectibles();
        }
      }
    }
  }

  // TODO: should delete the collectable if collected.
  // void collect(Collectible collectible) {}

  // TODO: Implement attack method
  void attack() {
    print("Attacking");
  }
}
