import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_colors.dart';
import '../models/plant.dart';
import '../providers/plant_provider.dart';

void showPlantDetail(BuildContext context, Plant plant) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.accent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => PlantDetailSheet(plant: plant),
  );
}

class PlantDetailSheet extends StatelessWidget {
  final Plant plant;

  const PlantDetailSheet({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    context.watch<PlantProvider>();
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  const SizedBox(height: 220),
                  Container(height: 40, color: AppColors.surface),
                ],
              ),
              Positioned(
                top: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 28,
                left: 0,
                right: 0,
                height: 232,
                child: Image.asset(
                  plant.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.eco, size: 72, color: AppColors.primary),
                ),
              ),
            ],
          ),
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(plant.name, style: textTheme.headlineSmall),
                          Text(plant.category, style: textTheme.bodySmall),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => context
                          .read<PlantProvider>()
                          .toggleFavorite(plant.id),
                      icon: Icon(
                        plant.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: plant.isFavorite
                            ? Colors.redAccent
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(plant.description, style: textTheme.bodyMedium),
                const SizedBox(height: 16),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _InfoTile(
                        icon: Icons.water_drop_outlined,
                        label: 'Penyiraman',
                        value: plant.watering,
                      ),
                      const SizedBox(width: 8),
                      _InfoTile(
                        icon: Icons.wb_sunny_outlined,
                        label: 'Cahaya',
                        value: plant.sunlight,
                      ),
                      const SizedBox(width: 8),
                      _InfoTile(
                        icon: Icons.spa_outlined,
                        label: 'Perawatan',
                        value: plant.careLevel,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tutup'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
