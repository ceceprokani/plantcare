import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../models/plant.dart';
import '../providers/plant_provider.dart';
import 'plant_detail_sheet.dart';
import 'plant_image.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => showPlantDetail(context, plant),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  PlantImage(image: plant.image),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: () =>
                          context.read<PlantProvider>().toggleFavorite(plant.id),
                      icon: Icon(
                        plant.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: plant.isFavorite ? Colors.redAccent : AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    style: textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          plant.category,
                          style: textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          plant.careLevel,
                          style: const TextStyle(fontSize: 11, color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
