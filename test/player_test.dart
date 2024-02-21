import "package:ant_new/scout/player.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test('Player move left', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveLeft();
    expect(player.position, 0);
  });

  test('Player move right', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveRight();
    expect(player.position, 2);
  });

  test('Player move up', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveUp();
    expect(player.position, 1);
  });

  test('Player move down', () {
    Player player = Player(
        className: "medic",
        carryingLoad: 2,
        lightSource: 1,
        health: 10,
        position: 1);
    player.moveDown();
    expect(player.position, 6);
  });
}
