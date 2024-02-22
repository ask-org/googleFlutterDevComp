class Global {
  final int _rows = 8;
  final int _cols = 5;
  final int _totalEnemyCount = 3;
  final int _totalObstacleCount = 8;
  final int _totalCollectableCount = 5;

  get totalCells => rows * _cols;
  get rows => _rows;
  get cols => _cols;
  get totalEnemyCount => _totalEnemyCount;
  get totalObstacleCount => _totalObstacleCount;
  get totalCollectableCount => _totalCollectableCount;

  static List<String> availableStates = [
    'obstacle',
    'enemy',
    'empty',
    'collectable'
  ];
}
