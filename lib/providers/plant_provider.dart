import 'package:flutter/foundation.dart';
import '../data/plant_data.dart';
import '../models/plant.dart';

class PlantProvider extends ChangeNotifier {
  final List<Plant> _plants = plantList;
  final Plant featured = featuredPlant;
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  List<Plant> get plants => _plants;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<Plant> get favoritePlants =>
      [featured, ..._plants].where((plant) => plant.isFavorite).toList();

  List<Plant> get filteredPlants {
    final query = _searchQuery.toLowerCase();
    return _plants.where((plant) {
      final matchCategory =
          _selectedCategory == 'Semua' || plant.category == _selectedCategory;
      final matchSearch = plant.name.toLowerCase().contains(query);
      return matchCategory && matchSearch;
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(int plantId) {
    final plant = [..._plants, featured].firstWhere((p) => p.id == plantId);
    plant.isFavorite = !plant.isFavorite;
    notifyListeners();
  }
}
