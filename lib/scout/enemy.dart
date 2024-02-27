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

  static int count = 1;
  _moveEnemy(int newPos, String field) {
    count++;
    if (field == 'empty') {
      position = newPos;
      utils.addToAllPostion(newPos);
      utils.removeFromAllPostion(position);
    } else {
      randomMove();
    }
  }

  void randomMove() {
    int random = utils.randomNumGenerator(4);
    String top = utils.checkField(position - global.cols as int);
    String bottom = utils.checkField(position + global.cols as int);
    String left = utils.checkField(position - 1);
    String right = utils.checkField(position + 1);
    print(
        'pos: $position, top: $top, bottom: $bottom, left: $left, right: $right');
    switch (random) {
      case 0:
        _moveEnemy(position - global.cols as int, top);
        break;
      case 1:
        _moveEnemy(position + global.cols as int, bottom);
        break;
      case 2:
        _moveEnemy(position + 1, right);
        break;
      case 3:
        _moveEnemy(position - 1, left);
        break;
      default:
    }
  }

  void moveUp({required String intendedPosition}) {
    if (!Global.availableStates.contains(intendedPosition)) {
      throw Exception('Invalid position');
    }

    if (position >= global.cols) {
      if (intendedPosition == 'empty') {
        _moveEnemy(position - global.cols as int, intendedPosition);
      }
    }
  }

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
