import 'package:flutter_test/flutter_test.dart';
import 'package:rimbun/providers/plant_provider.dart';

void main() {
  test('search is case-insensitive and category filter works', () {
    final provider = PlantProvider();
    expect(provider.filteredPlants.length, 6);

    provider.setSearchQuery('DRACAENA');
    expect(provider.filteredPlants.single.name, 'Dracaena');

    provider.setSearchQuery('');
    provider.setSelectedCategory('Sukulen');
    expect(provider.filteredPlants.single.name, 'Baby Rubber Plant');

    provider.setSearchQuery('xyz');
    expect(provider.filteredPlants, isEmpty);
  });

  test('toggleFavorite flips state', () {
    final provider = PlantProvider();
    provider.toggleFavorite(1);
    expect(provider.plants.first.isFavorite, isTrue);
    provider.toggleFavorite(1);
    expect(provider.plants.first.isFavorite, isFalse);
  });
}
