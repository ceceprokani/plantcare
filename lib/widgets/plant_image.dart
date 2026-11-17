import 'package:material_ui/material_ui.dart';
import '../core/theme/app_colors.dart';

class PlantImage extends StatelessWidget {
  final String image;
  final double? height;
  final double iconSize;

  const PlantImage({
    super.key,
    required this.image,
    this.height,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: AppColors.accent,
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.eco, size: iconSize, color: AppColors.primary),
      ),
    );
  }
}
