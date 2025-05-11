import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/services/settings_storage.dart';

import 'core/routes/app_router.dart'; // Import the router

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsService = SettingsService();
  await settingsService.loadSettings(); // Ensures settings are loaded before app starts

  runApp(
    ChangeNotifierProvider.value(
      value: settingsService,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key}); // Instantiate your AppRouter

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter.config(), // Use the generated router config
      debugShowCheckedModeBanner: false,
    );
  }
}
