import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/services/settings_storage.dart';
import '../../../../core/utils/Images.dart';
import '../../../../core/utils/temperature_utils.dart';

@RoutePage()
class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsService>(
      builder: (context, settings, _) {
        final cityName = settings.selectedCity;
        final currentTempCelsius = settings.weatherData?.currentWeather.temperature ?? 0;
        final feelsLikeTempCelsius = settings.weatherData?.currentWeather.feelsLike ?? 0;

        final currentTemp = settings.isCelsius
            ? TemperatureUtils.format(currentTempCelsius)
            : TemperatureUtils.format(TemperatureUtils.toFahrenheit(currentTempCelsius));

        final feelsLikeTemp = settings.isCelsius
            ? TemperatureUtils.format(feelsLikeTempCelsius)
            : TemperatureUtils.format(TemperatureUtils.toFahrenheit(feelsLikeTempCelsius));

        final weatherCondition = settings.weatherData?.currentWeather.conditionDescription ?? "Unknown";
        final weatherIconAsset = WeatherImageUtils.getImageAssetForCondition(weatherCondition);

        final humidity = settings.weatherData?.currentWeather.humidity ?? 0;
        final windSpeed = settings.weatherData?.currentWeather.windSpeed ?? 0;
        final windDirection = settings.weatherData?.currentWeather.windDirection ?? "Unknown";
        final pressure = settings.weatherData?.currentWeather.pressure ?? 0;
        final visibility = settings.weatherData?.currentWeather.visibility ?? 0;

        final backgroundColor = getBackgroundColor(weatherCondition);

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [backgroundColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const SizedBox(),
                  expandedHeight: 300,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black, size: 24),
                      onPressed: () => context.router.push(const SettingsRoute()),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 32),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '$currentTemp°${settings.isCelsius ? 'C' : 'F'} | $weatherCondition',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(weatherIconAsset, fit: BoxFit.cover),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white.withOpacity(0.7), Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Weather Metrics',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.5,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final metrics = [
                                WeatherMetricBox(title: 'Humidity', value: '$humidity%'),
                                WeatherMetricBox(title: 'Wind Speed', value: '$windSpeed km/h'),
                                WeatherMetricBox(title: 'Wind Direction', value: windDirection),
                                WeatherMetricBox(title: 'Feels Like', value: '$feelsLikeTemp°${settings.isCelsius ? 'C' : 'F'}'),
                                WeatherMetricBox(title: 'Pressure', value: '$pressure hPa'),
                                WeatherMetricBox(title: 'Visibility', value: '$visibility km'),
                              ];
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: metrics[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color getBackgroundColor(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('rain')) return Colors.blueGrey.shade300;
    if (c.contains('clear')) return Colors.orange.shade200;
    if (c.contains('cloud')) return Colors.grey.shade300;
    if (c.contains('snow')) return Colors.lightBlue.shade100;
    return Colors.cyan.shade50;
  }
}

class WeatherMetricBox extends StatelessWidget {
  final String title;
  final String value;

  const WeatherMetricBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.indigo.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherImageUtils {
  static String getImageAssetForCondition(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('rain')) return Images.rain;
    if (c.contains('snow')) return Images.snow;
    if (c.contains('cloud')) return Images.cloud;
    if (c.contains('clear') || c.contains('sunny')) return Images.clear;
    if (c.contains('storm') || c.contains('thunder')) return Images.storm;
    if (c.contains('mist') || c.contains('fog')) return Images.mist;
    return Images.defaultWeather;
  }
}
