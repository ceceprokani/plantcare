import 'package:material_ui/material_ui.dart';

import '../widgets/category_filter.dart';
import '../widgets/featured_plant_card.dart';
import '../widgets/header_section.dart';
import '../widgets/plant_grid.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    HeaderSection(),
                    SizedBox(height: 20),
                    SearchBarWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const CategoryFilter(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FeaturedPlantCard(),
                    const SizedBox(height: 24),
                    Text(
                      'Koleksi Tanaman',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    const PlantGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
