import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../models/plant.dart';
import '../providers/plant_provider.dart';
import 'empty_state.dart';
import 'plant_detail_sheet.dart';
import 'plant_image.dart';

void showFavoriteList(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) => FavoriteListSheet(
      onPlantTap: (plant) {
        Navigator.pop(sheetContext);
        showPlantDetail(context, plant);
      },
    ),
  );
}

class FavoriteListSheet extends StatelessWidget {
  final void Function(Plant plant) onPlantTap;

  const FavoriteListSheet({super.key, required this.onPlantTap});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PlantProvider>();
    final favorites = provider.favoritePlants;
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Tanaman Favorit (${favorites.length})', style: textTheme.titleMedium),
            const SizedBox(height: 12),
            if (favorites.isEmpty)
              const EmptyState(
                icon: Icons.favorite_border,
                title: 'Belum ada tanaman favorit',
                message: 'Tekan ikon hati pada tanaman untuk menyimpannya.',
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: favorites.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final plant = favorites[index];
                    return ListTile(
                      onTap: () => onPlantTap(plant),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      tileColor: AppColors.background,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 48,
                          child: PlantImage(image: plant.image, height: 48, iconSize: 24),
                        ),
                      ),
                      title: Text(plant.name, style: textTheme.titleSmall),
                      subtitle: Text(plant.category, style: textTheme.bodySmall),
                      trailing: IconButton(
                        onPressed: () => provider.toggleFavorite(plant.id),
                        icon: const Icon(Icons.favorite, color: Colors.redAccent),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
