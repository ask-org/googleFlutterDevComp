class Global {
  final int _rows = 12;
  final int _cols = 8;
  final int _totalEnemyCount = 4;
  final int _totalObstacleCount = 15;
  final int _totalCollectableCount = 5;
  int _fertilizerCount = 0;
  int _foodCount = 0;
  int _woodCount = 0;
  int _airPackCount = 0;

  get totalCells => _rows * _cols;
  get rows => _rows;
  get cols => _cols;
  get totalEnemyCount => _totalEnemyCount;
  get totalObstacleCount => _totalObstacleCount;
  get totalCollectableCount => _totalCollectableCount;
  get fertilizer => _fertilizerCount;
  get food => _foodCount;
  get wood => _woodCount;
  get airpack => _airPackCount;

  set fertilizerCount(int fertilizer) {
    _fertilizerCount = fertilizer;
  }

  set foodCount(int food) {
    _foodCount = food;
  }

  set woodCount(int wood) {
    _woodCount = wood;
  }

  set airPackCount(int air) {
    _airPackCount = air;
  }

  static List<String> availableStates = [
    'obstacle',
    'enemy',
    'empty',
    'collectable'
  ];

  static List<String> avaibaleReources = [
    'fertilizer',
    'food',
    'wood',
    'airpack'
  ];
}
