import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../providers/plant_provider.dart';
import 'empty_state.dart';
import 'plant_card.dart';

class PlantGrid extends StatelessWidget {
  const PlantGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final plants = context.watch<PlantProvider>().filteredPlants;
    if (plants.isEmpty) {
      return const EmptyState(
        icon: Icons.search_off,
        title: 'Tanaman tidak ditemukan',
        message: 'Coba kata kunci atau kategori lain.',
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: plants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => PlantCard(plant: plants[index]),
    );
  }
}
