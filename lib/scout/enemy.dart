// import 'dart:math';

import 'package:ant_new/scout/global.dart';
import 'package:ant_new/scout/utils.dart';

Utils utils = Utils();
Global global = Global();

class Enemy {
  String name;
  int health;
  int experiencePoints;
  int gold;
  int damagePoint;
  int position;

  Enemy(
      {required this.name,
      required this.health,
      required this.experiencePoints,
      required this.gold,
      required this.damagePoint,
      required this.position});

  // _moveEnemy(int newPos, String field) {
  //   position = newPos;
  //   utils.addToAllPostion(newPos);
  //   utils.removeFromAllPostion(position);
  // }

  void moveLeft({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }

    if (position % global.cols != 0) {
      if (intendedPosition == 'empty') {}
    }
  }

  void attack() {
    print("Enemy attacks for $damagePoint damage!");
  }

  void takeDamage(int damage) {
    health -= damage;
    print("Enemy took $damage damage!");
  }

  void die() {
    print("Enemy died!");
  }

  void dropLoot() {
    print("Enemy dropped $gold gold and $experiencePoints experience points!");
  }

  void loot() {
    print("Enemy looted!");
  }
}
