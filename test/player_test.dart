import "package:ant_new/scout/player.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test('Player should not move left if we send obstacle as intendedPostion',
      () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveLeft(intendedPosition: 'obstacle', characterType: 'scout');
    expect(player.position, 1);
  });

  test('Player should move left if we send obstacle as intendedPostion', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveLeft(intendedPosition: 'empty');
    expect(player.position, 0);
  });

  test('Player move right', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveRight(intendedPosition: 'empty');
    expect(player.position, 2);
  });

  test('Player move up', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveUp(intendedPosition: 'empty');
    expect(player.position, 1);
  });

  test('Player move down', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveDown(intendedPosition: 'empty');
    expect(player.position, 6);
  });

  test('Can collect if carry weight is not reached', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.collect(10);
    expect(player.carryingLoad, 1);
  });

  test('Cannot collect if carry weight is reached', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 1,
        lightSource: 1,
        health: 10,
        position: 1);
    expect(player.collect(10), 10);
    expect(player.carryingLoad, 0);
  });
}
