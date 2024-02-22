class Collectible {
  String name;
  String description;
  String image;
  int quantity;
  int position;

  Collectible(
      {required this.name,
      required this.description,
      required this.position,
      required this.image,
      required this.quantity});

  @override
  String toString() {
    return 'Collectible{name: $name, description: $description, image: $image, quantity: $quantity, position: $position}';
  }
}
