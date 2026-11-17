import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/plant_provider.dart';
import 'favorite_list_sheet.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final favoriteCount = context.watch<PlantProvider>().favoritePlants.length;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rimbun', style: textTheme.titleMedium),
              const SizedBox(height: 4),
              Text('Temukan Tanaman Terbaikmu', style: textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(
                'Kenali tanaman hias dan cara merawatnya.',
                style: textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Fitri Wulandari · 25552012009 · TIF K-24B',
                style: textTheme.labelSmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          tooltip: 'Daftar Favorit',
          onPressed: () => showFavoriteList(context),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.accent,
            padding: const EdgeInsets.all(12),
          ),
          icon: Badge(
            label: Text('$favoriteCount'),
            isLabelVisible: favoriteCount > 0,
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.favorite, color: AppColors.primary, size: 28),
          ),
        ),
      ],
    );
  }
}
