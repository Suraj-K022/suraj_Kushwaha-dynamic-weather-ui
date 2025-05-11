import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/features/weather/presentation/screens/home_screen.dart';
import 'package:task/features/weather/presentation/screens/settings_screen.dart';
import 'package:task/features/weather/presentation/screens/forcast_detail_screen.dart';
import 'package:task/features/weather/presentation/screens/splashScreen.dart';
import '../models/weather_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter implements AutoRouterConfig {
  AppRouter({super.navigatorKey}); // Optional if you want custom navKey

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WeatherHomeRoute.page),
    AutoRoute(page: ForecastDetailRoute.page, path: '/forecast/:cityName'),
    AutoRoute(page: SettingsRoute.page),
  ];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
