import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/weather_model.dart';

@RoutePage()
class HourlyWeatherDetailScreen extends StatelessWidget {
  final HourlyForecast forecast;

  const HourlyWeatherDetailScreen({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a');

    return Scaffold(
      appBar: AppBar(
        title: Text(timeFormat.format(forecast.time)),
        leading: InkWell(onTap: ()=> Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 24,color: Colors.black,)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _weatherHeader(context, forecast),
            const SizedBox(height: 20),
            _infoCard('Time', timeFormat.format(forecast.time)),
            _infoCard('Temperature', '${forecast.temperature}°'),
            _infoCard('Condition', getConditionText(forecast.conditionCode)),
            _infoCard('Icon Code', forecast.iconId), // Optional for debugging or if icon mapping is not complete
          ],
        ),
      ),
    );
  }

  Widget _weatherHeader(BuildContext context, HourlyForecast forecast) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            _getWeatherIcon(forecast.conditionCode),
            size: 64,
            color: Colors.orangeAccent,
          ),
          const SizedBox(height: 10),
          Text(
            getConditionText(forecast.conditionCode),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  IconData _getWeatherIcon(String code) {
    switch (code) {
      case 'clear':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.umbrella;
      case 'snow':
        return Icons.ac_unit;
      case 'storm':
        return Icons.flash_on;
      default:
        return Icons.help_outline;
    }
  }
}

String getConditionText(String code) {
  switch (code) {
    case 'clear':
      return 'Clear Sky';
    case 'cloudy':
      return 'Cloudy';
    case 'rainy':
      return 'Rainy';
    case 'snow':
      return 'Snow';
    case 'storm':
      return 'Stormy';
    default:
      return 'Unknown';
  }
}
