import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/weather_model.dart';

@RoutePage()
class ForecastDetailScreen extends StatelessWidget {
  final int dayIndex;
  final List<DailyForecast> forecast;

  const ForecastDetailScreen({
    super.key,
    required this.dayIndex,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    final day = forecast[dayIndex];
    final dateFormat = DateFormat('EEE, MMM d');
    final timeFormat = DateFormat('hh:mm a');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                dateFormat.format(day.date),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _infoTile('High Temperature', '${day.highTemp}°', isBold: true),
                _infoTile('Low Temperature', '${day.lowTemp}°'),
                _infoTile('Condition', day.conditionDescription),
                _infoTile('UV Index', '${day.uvIndex}', isBold: true),
                _infoTile('Precipitation', '${(day.precipitationProbability * 100).toStringAsFixed(0)}%'),
                _infoTile('Sunrise', timeFormat.format(day.sunrise)),
                _infoTile('Sunset', timeFormat.format(day.sunset)),
                const SizedBox(height: 20),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: day.hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      final hour = day.hourlyForecasts[index];
                      return Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              timeFormat.format(hour.time),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Icon(Icons.wb_sunny, color: Colors.orangeAccent),
                            const SizedBox(height: 6),
                            Text(
                              '${hour.temperature}°',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
