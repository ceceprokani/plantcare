import 'package:material_ui/material_ui.dart';
import '../core/theme/app_colors.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.accent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              Icon(icon, size: 56, color: AppColors.primary),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(message, textAlign: TextAlign.center, style: textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
