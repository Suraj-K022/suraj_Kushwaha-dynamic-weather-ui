import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@Freezed()
abstract class AppWeatherData with _$AppWeatherData {
  const factory AppWeatherData({
    required CurrentWeather currentWeather,
    required List<DailyForecast> sevenDayForecast,
    required WeatherSettings appSettings,
  }) = _AppWeatherData;

  factory AppWeatherData.fromJson(Map<String, dynamic> json) =>
      _$AppWeatherDataFromJson(json);
}

@Freezed()
abstract class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    required String city,
    required double temperature,
    required String conditionCode,
    required String conditionDescription,
    required int humidity,
    required double windSpeed,
    required String windDirection,
    required double feelsLike,
    required double pressure,
    required double visibility,
    required String iconId,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

}

@Freezed()
abstract class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required DateTime date,
    required double highTemp,
    required double lowTemp,
    required String conditionCode,
    required String conditionDescription,
    required String iconId,
    required List<HourlyForecast> hourlyForecasts,
    required double precipitationProbability,
    required int uvIndex,
    required DateTime sunrise,
    required DateTime sunset,
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}

@Freezed()
abstract class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required DateTime time,
    required double temperature,
    required String conditionCode,
    required String iconId,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
}

@Freezed()
abstract class WeatherSettings with _$WeatherSettings {
  const factory WeatherSettings({
    required bool isCelsius,
    required String selectedCityName,
  }) = _WeatherSettings;

  factory WeatherSettings.fromJson(Map<String, dynamic> json) =>
      _$WeatherSettingsFromJson(json);
}
