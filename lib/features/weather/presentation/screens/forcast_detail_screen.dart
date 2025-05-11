import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/features/weather/presentation/widgets/weather_detail_panel.dart';

@RoutePage()
class ForecastDetailScreen extends StatelessWidget {
  final int dayIndex;

  const ForecastDetailScreen({super.key, required this.dayIndex});

  @override
  Widget build(BuildContext context) {
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
            child: WeatherDetailPanel(dayIndex: dayIndex),
          ),
        ],
      ),
    );
  }
}
