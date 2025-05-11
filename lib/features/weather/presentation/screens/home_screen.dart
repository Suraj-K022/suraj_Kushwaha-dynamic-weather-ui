import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/storage/settings_storage.dart';

import '../../../../core/utils/temperature_utils.dart';  // Import the TemperatureUtils class

@RoutePage()
class WeatherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsService>(
      builder: (context, settings, _) {
        final cityName = settings.selectedCity;

        // Get the raw temperature data
        final currentTempCelsius = settings.weatherData?.currentWeather.temperature ?? 0;
        final feelsLikeTempCelsius = settings.weatherData?.currentWeather.feelsLike ?? 0;

        // Convert based on the selected temperature unit
        final currentTemp = settings.isCelsius
            ? TemperatureUtils.format(currentTempCelsius)
            : TemperatureUtils.format(TemperatureUtils.toFahrenheit(currentTempCelsius));

        final feelsLikeTemp = settings.isCelsius
            ? TemperatureUtils.format(feelsLikeTempCelsius)
            : TemperatureUtils.format(TemperatureUtils.toFahrenheit(feelsLikeTempCelsius));

        // Weather data
        final weatherCondition = settings.weatherData?.currentWeather.conditionDescription ?? "Unknown";
        final weatherIconAsset = 'assets/images/sunny.png';  // You can dynamically change this based on the weather
        final humidity = settings.weatherData?.currentWeather.humidity ?? 0;
        final windSpeed = settings.weatherData?.currentWeather.windSpeed ?? 0;
        final windDirection = settings.weatherData?.currentWeather.windDirection ?? "Unknown";
        final pressure = settings.weatherData?.currentWeather.pressure ?? 0;
        final visibility = settings.weatherData?.currentWeather.visibility ?? 0;

        return Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: SizedBox(),
                expandedHeight: 320,
                floating: false,
                pinned: true,
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      context.router.push(SettingsRoute());
                    },
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                  title: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '$cityName - $currentTemp°${settings.isCelsius ? 'C' : 'F'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 1),
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black45, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Weather Metrics Panel
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Weather Metrics',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      // SizedBox(height: 20),
                      // Use GridView for uniform sizing
                      GridView.builder(
                        shrinkWrap: true, // Ensures GridView takes only as much space as needed
                        physics: NeverScrollableScrollPhysics(), // Prevents scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 16, // Space between columns
                          mainAxisSpacing: 16, // Space between rows
                          childAspectRatio: 1.5, // Controls the aspect ratio of each box
                        ),
                        itemCount: 6, // Total number of items in the grid
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

                          return weatherMetrics[index]; // Return the corresponding WeatherMetricBox
                        },
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        );
      },
    );
  }
}



class WeatherMetricBox extends StatelessWidget {
  final String title;
  final String value;

  const WeatherMetricBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // More rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Increased padding for larger cards
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
