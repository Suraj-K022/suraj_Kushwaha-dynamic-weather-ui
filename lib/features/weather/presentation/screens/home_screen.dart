import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/storage/settings_storage.dart';
@RoutePage()
class WeatherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsService>(
      builder: (context, settings, _) {
        final cityName = settings.selectedCity;
        final currentTemp = settings.isCelsius ? 25.3 : 77.5;
        final weatherCondition = "Sunny"; // Replace with dynamic weather data
        final weatherIconAsset = 'assets/images/sunny.png'; // Replace with dynamic logic
        final humidity = 60; // Example value
        final windSpeed = 15; // Example value in km/h
        final windDirection = "NE"; // Example value
        final feelsLikeTemp = 24.0; // Example value
        final pressure = 1012; // Example value in hPa
        final visibility = 10.0; // Example value in km

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // Sliver AppBar for Current Weather
              SliverAppBar(
                leading: SizedBox(),
                expandedHeight: 300,
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
                      Icon(Icons.location_on, color: Colors.white70, size: 18),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '$cityName - ${currentTemp.toStringAsFixed(1)}°${settings.isCelsius ? 'C' : 'F'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              )
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

              // Weather Metrics Panel in Boxes
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Weather Metrics',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          WeatherMetricBox(title: 'Humidity', value: '$humidity%'),
                          WeatherMetricBox(title: 'Wind Speed', value: '$windSpeed km/h'),
                          WeatherMetricBox(title: 'Wind Direction', value: windDirection),
                          WeatherMetricBox(
                            title: 'Feels Like',
                            value: '${feelsLikeTemp.toStringAsFixed(1)}°${settings.isCelsius ? 'C' : 'F'}',
                          ),
                          WeatherMetricBox(title: 'Pressure', value: '$pressure hPa'),
                          WeatherMetricBox(title: 'Visibility', value: '$visibility km'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Widget to display each weather metric as a box
class WeatherMetricBox extends StatelessWidget {
  final String title;
  final String value;

  const WeatherMetricBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2, // Two per row with spacing
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
