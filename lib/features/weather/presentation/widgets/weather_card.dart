import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherMetricsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // These values would ideally be dynamic or come from a model
    final metrics = {
      "Humidity": "65%",
      "Wind": "15 km/h NW",
      "Feels Like": "27°C",
      "Pressure": "1012 hPa",
      "Visibility": "10 km",
    };

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: metrics.entries.map((entry) {
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
    );
  }
}
