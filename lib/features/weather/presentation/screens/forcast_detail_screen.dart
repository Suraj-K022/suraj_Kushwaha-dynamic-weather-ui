import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/features/weather/presentation/widgets/weather_detail_panel.dart';

import '../../../../core/models/weather_model.dart';

@RoutePage()
class ForecastDetailScreen extends StatelessWidget {
  final int dayIndex;
  final List<DailyForecast> forecast;  // Add the forecast parameter

  const ForecastDetailScreen({super.key, required this.dayIndex, required this.forecast});

  @override
  Widget build(BuildContext context) {
    // Get the forecast data for the specific day
    final DailyForecast selectedForecast = forecast[dayIndex];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(title: Text('Forecast Details')),
          ),
          SliverToBoxAdapter(
            // Placeholder for hourly forecast list
            child: SizedBox(
              height: 150,
              child: Center(child: Text("Hourly Forecast")),
            ),
          ),
          SliverToBoxAdapter(
            child: WeatherDetailPanel(
              forecast: selectedForecast,
              // Pass the selected day's forecast
            ),
          ),
        ],
      ),
    );
  }
}

