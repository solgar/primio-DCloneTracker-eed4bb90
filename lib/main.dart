// D2R Tracker — Diablo Clone & Terror Zone tracker for Diablo 2: Resurrected.
// rebuild2
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/tracker_provider.dart';
import 'router/app_router.dart';
import 'services/tracker_service.dart';
import 'theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => TrackerService()),
        ChangeNotifierProvider(
          create: (ctx) => TrackerProvider(service: ctx.read<TrackerService>()),
        ),
      ],
      child: MaterialApp.router(
        title: 'DClone Tracker',
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}