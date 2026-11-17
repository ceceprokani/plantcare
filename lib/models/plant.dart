class Plant {
  final int id;
  final String name;
  final String category;
  final String description;
  final String image;
  final String watering;
  final String sunlight;
  final String careLevel;
  bool isFavorite;

  Plant({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.watering,
    required this.sunlight,
    required this.careLevel,
    this.isFavorite = false,
  });
}
