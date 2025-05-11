import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/weather_model.dart';
import '../../../../core/routes/app_router.dart';

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
            leading: InkWell(onTap: ()=> Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back_ios_new_outlined,size: 24,color: Colors.black,)),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                dateFormat.format(day.date),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF0D47A1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _infoTile('High', '${day.highTemp}°', isBold: true),
                _infoTile('Low', '${day.lowTemp}°'),
                _infoTile('Condition', day.conditionDescription),
                _infoTile('UV Index', '${day.uvIndex}', isBold: true),
                _infoTile('Rain Chance', '${(day.precipitationProbability * 100).toStringAsFixed(0)}%'),
                _infoTile('Sunrise', timeFormat.format(day.sunrise)),
                _infoTile('Sunset', timeFormat.format(day.sunset)),
                const SizedBox(height: 30),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: day.hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      final hour = day.hourlyForecasts[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushRoute(
                            HourlyWeatherDetailRoute(forecast: hour),
                          );
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timeFormat.format(hour.time),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Icon(
                                _getWeatherIcon(hour.conditionCode),
                                color: _getIconColor(hour.conditionCode),
                                size: 28,
                              ),
                              Text(
                                '${hour.temperature}°',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String code) {
    switch (code) {
      case 'clear':
        return Icons.wb_sunny_rounded;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.umbrella_rounded;
      case 'storm':
        return Icons.flash_on;
      case 'snow':
        return Icons.ac_unit_rounded;
      default:
        return Icons.help_outline;
    }
  }

  Color _getIconColor(String code) {
    switch (code) {
      case 'clear':
        return Colors.orange;
      case 'cloudy':
        return Colors.grey;
      case 'rainy':
        return Colors.blue;
      case 'storm':
        return Colors.deepPurple;
      case 'snow':
        return Colors.lightBlueAccent;
      default:
        return Colors.black26;
    }
  }
}
