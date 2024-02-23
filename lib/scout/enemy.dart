class Enemy {
  String name;
  int health;
  int experiencePoints;
  int gold;
  int damagePoint;

  Enemy(this.name, this.health, this.experiencePoints, this.gold,
      this.damagePoint);

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
