import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  expandedHeight: 320,
                  floating: false,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black,size: 24,),
                      onPressed: () {
                        context.router.push(const SettingsRoute());
                      },
                    ),
                  ],
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // White background
                    ),
                    child: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                      title: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white70, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '$cityName - $currentTemp°${settings.isCelsius ? 'C' : 'F'}',
                              style: GoogleFonts.lato(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black, // Change text color to black for better visibility
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            weatherIconAsset,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.darken, // Optional, if you want to add any blend effect
                          ),
                          Container(
                            color: Colors.white.withOpacity(0.5), // Add a semi-transparent white overlay on the image
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Weather Metrics',
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade800,
                          ),
                        ),
                        // const SizedBox(height: 16),
                        GridView.builder(
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
                            final weatherMetrics = [
                              WeatherMetricBox(title: 'Humidity', value: '$humidity%'),
                              WeatherMetricBox(title: 'Wind Speed', value: '$windSpeed km/h'),
                              WeatherMetricBox(title: 'Wind Direction', value: windDirection),
                              WeatherMetricBox(
                                title: 'Feels Like',
                                value: '$feelsLikeTemp°${settings.isCelsius ? 'C' : 'F'}',
                              ),
                              WeatherMetricBox(title: 'Pressure', value: '$pressure hPa'),
                              WeatherMetricBox(title: 'Visibility', value: '$visibility km'),
                            ];

                            return weatherMetrics[index];
                          },
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

  const WeatherMetricBox({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: GoogleFonts.lato(
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
