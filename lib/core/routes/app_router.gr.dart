// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ForecastDetailScreen]
class ForecastDetailRoute extends PageRouteInfo<ForecastDetailRouteArgs> {
  ForecastDetailRoute({
    Key? key,
    required int dayIndex,
    List<PageRouteInfo>? children,
  }) : super(
         ForecastDetailRoute.name,
         args: ForecastDetailRouteArgs(key: key, dayIndex: dayIndex),
         initialChildren: children,
       );

  static const String name = 'ForecastDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForecastDetailRouteArgs>();
      return ForecastDetailScreen(key: args.key, dayIndex: args.dayIndex);
    },
  );
}

class ForecastDetailRouteArgs {
  const ForecastDetailRouteArgs({this.key, required this.dayIndex});

  final Key? key;

  final int dayIndex;

  @override
  String toString() {
    return 'ForecastDetailRouteArgs{key: $key, dayIndex: $dayIndex}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [WeatherHomeScreen]
class WeatherHomeRoute extends PageRouteInfo<void> {
  const WeatherHomeRoute({List<PageRouteInfo>? children})
    : super(WeatherHomeRoute.name, initialChildren: children);

  static const String name = 'WeatherHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WeatherHomeScreen();
    },
  );
}
