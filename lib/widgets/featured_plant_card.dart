import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/plant_provider.dart';
import 'plant_detail_sheet.dart';

class FeaturedPlantCard extends StatelessWidget {
  const FeaturedPlantCard({super.key});

  @override
  Widget build(BuildContext context) {
    final plant = context.watch<PlantProvider>().featured;
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          constraints: const BoxConstraints(minHeight: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Unggulan',
                        style: TextStyle(color: AppColors.textPrimary, fontSize: 11),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      plant.name,
                      style: textTheme.titleMedium?.copyWith(color: AppColors.surface),
                    ),
                    Text(
                      plant.category,
                      style: textTheme.bodySmall?.copyWith(color: AppColors.accent),
                    ),
                    const SizedBox(height: 14),
                    FilledButton(
                      onPressed: () => showPlantDetail(context, plant),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: AppColors.primary,
                      ),
                      child: const Text('Lihat Info'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 150),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          width: 180,
          height: 250,
          child: Image.asset(
            plant.image,
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.eco, size: 64, color: AppColors.surface),
          ),
        ),
      ],
    );
  }
}
