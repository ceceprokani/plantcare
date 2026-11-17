import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/plant_provider.dart';
import 'screens/home_screen.dart';

class RimbunApp extends StatelessWidget {
  const RimbunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlantProvider(),
      child: MaterialApp(
        title: 'Rimbun',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
