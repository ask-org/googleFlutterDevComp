class Enemy {
  String name;
  int hitPoints;
  int experiencePoints;
  int gold;
  int damage;

  Enemy(
      this.name, this.hitPoints, this.experiencePoints, this.gold, this.damage);

  void attack() {
    print("Enemy attacks for $damage damage!");
  }

  void takeDamage(int damage) {
    hitPoints -= damage;
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
