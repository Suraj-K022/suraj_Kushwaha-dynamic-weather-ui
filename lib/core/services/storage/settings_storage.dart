import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/weather_model.dart'; // Add the necessary imports

class UserSettings {
  final bool isCelsius;
  final String selectedCity;

  UserSettings({
    required this.isCelsius,
    required this.selectedCity,
  });

  Map<String, dynamic> toMap() {
    return {
      'isCelsius': isCelsius,
      'selectedCity': selectedCity,
    };
  }

  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return UserSettings(
      isCelsius: map['isCelsius'],
      selectedCity: map['selectedCity'],
    );
  }
}

class SettingsService extends ChangeNotifier {
  bool isCelsius = true;
  String selectedCity = 'New York';
  bool _isLoading = false;
  AppWeatherData? weatherData;  // Holds the weather data

  bool get isLoading => _isLoading;


  final logger = Logger();

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      isCelsius = prefs.getBool('isCelsius') ?? true;
      selectedCity = prefs.getString('selectedCity') ?? 'New York';

      // Fetch initial weather data
      await fetchWeatherData(selectedCity);
    } catch (error) {
      logger.e('Error loading settings: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveSettings(UserSettings newSettings) async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isCelsius', newSettings.isCelsius);
      await prefs.setString('selectedCity', newSettings.selectedCity);

      isCelsius = newSettings.isCelsius;
      selectedCity = newSettings.selectedCity;

      // Fetch weather data based on new city
      await fetchWeatherData(newSettings.selectedCity);
    } catch (error) {
      logger.e('Error saving settings: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }



  // Fetch weather data for the selected city
  Future<void> fetchWeatherData(String city) async {
    final cityHash = city.hashCode;
    final random = cityHash % 1000;

    final baseTemp = 15.0 + (random % 100) / 10.0; // 15.0 to 25.0
    final baseHumidity = 50 + (random % 30);
    final basePressure = 1000 + (random % 20);

    final mockConditions = [
      'Clear Sky',
      'Partly Cloudy',
      'Overcast',
      'Rainy',
      'Stormy',
      'Snowy',
      'Foggy'
    ];

    final now = DateTime.now();
    final List<DailyForecast> forecast = List.generate(7, (i) {
      final date = now.add(Duration(days: i));
      final high = baseTemp + i + (random % 5);
      final low = baseTemp + i - 3 + (random % 3);
      final conditionIndex = (random + i * 13) % mockConditions.length;

      return DailyForecast(
        date: date,
        highTemp: high,
        lowTemp: low,
        conditionCode: '0${conditionIndex}d',
        conditionDescription: mockConditions[conditionIndex],
        iconId: '0${conditionIndex}d',
        hourlyForecasts: [], // Or generate mock hourly data
        precipitationProbability: (random % 100) / 100,
        uvIndex: (random % 11),
        sunrise: date.copyWith(hour: 6, minute: 0),
        sunset: date.copyWith(hour: 18, minute: 30),
      );
    });


    weatherData = AppWeatherData(
      currentWeather: CurrentWeather(
        city: city,
        temperature: baseTemp + 2,
        conditionCode: '01d',
        conditionDescription: mockConditions[random % mockConditions.length],
        humidity: baseHumidity,
        windSpeed: 5.0 + (random % 10),
        windDirection: ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'][random % 8],
        feelsLike: baseTemp + 1.5,
        pressure: double.parse(basePressure.toString()),
        visibility: 10.0,
        iconId: '01d',
      ),
      sevenDayForecast: forecast,
      appSettings: WeatherSettings(
        isCelsius: isCelsius,
        selectedCityName: city,
      ),
    );

    notifyListeners();
  }


}

