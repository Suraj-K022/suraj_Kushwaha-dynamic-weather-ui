import 'package:flutter/material.dart';


class WeatherDetailPanel extends StatelessWidget {
  final int dayIndex;

  const WeatherDetailPanel({Key? key, required this.dayIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample detailed weather data for the selected day (this should come from a model/API)
    final weatherDetails = {
      "Description": "Partly cloudy with a chance of rain",
      "Temperature Range": "15°C - 22°C",
      "Wind Speed": "18 km/h",
      "Pressure": "1010 hPa",
      "Humidity": "70%",
      "UV Index": "Moderate",
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: weatherDetails.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key, style: TextStyle(fontSize: 16)),
                    Text(entry.value, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
