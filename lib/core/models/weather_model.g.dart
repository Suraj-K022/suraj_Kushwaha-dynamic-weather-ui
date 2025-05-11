// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppWeatherData _$AppWeatherDataFromJson(Map<String, dynamic> json) =>
    _AppWeatherData(
      currentWeather: CurrentWeather.fromJson(
          json['currentWeather'] as Map<String, dynamic>),
      sevenDayForecast: (json['sevenDayForecast'] as List<dynamic>)
          .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      appSettings:
          WeatherSettings.fromJson(json['appSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppWeatherDataToJson(_AppWeatherData instance) =>
    <String, dynamic>{
      'currentWeather': instance.currentWeather,
      'sevenDayForecast': instance.sevenDayForecast,
      'appSettings': instance.appSettings,
    };

_CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    _CurrentWeather(
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      conditionCode: json['conditionCode'] as String,
      conditionDescription: json['conditionDescription'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      windDirection: json['windDirection'] as String,
      feelsLike: (json['feelsLike'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      iconId: json['iconId'] as String,
    );

Map<String, dynamic> _$CurrentWeatherToJson(_CurrentWeather instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'conditionCode': instance.conditionCode,
      'conditionDescription': instance.conditionDescription,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'windDirection': instance.windDirection,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
      'iconId': instance.iconId,
    };

_DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    _DailyForecast(
      date: DateTime.parse(json['date'] as String),
      highTemp: (json['highTemp'] as num).toDouble(),
      lowTemp: (json['lowTemp'] as num).toDouble(),
      conditionCode: json['conditionCode'] as String,
      conditionDescription: json['conditionDescription'] as String,
      iconId: json['iconId'] as String,
      hourlyForecasts: (json['hourlyForecasts'] as List<dynamic>)
          .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      precipitationProbability:
          (json['precipitationProbability'] as num).toDouble(),
      uvIndex: (json['uvIndex'] as num).toInt(),
      sunrise: DateTime.parse(json['sunrise'] as String),
      sunset: DateTime.parse(json['sunset'] as String),
    );

Map<String, dynamic> _$DailyForecastToJson(_DailyForecast instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'highTemp': instance.highTemp,
      'lowTemp': instance.lowTemp,
      'conditionCode': instance.conditionCode,
      'conditionDescription': instance.conditionDescription,
      'iconId': instance.iconId,
      'hourlyForecasts': instance.hourlyForecasts,
      'precipitationProbability': instance.precipitationProbability,
      'uvIndex': instance.uvIndex,
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
    };

_HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    _HourlyForecast(
      time: DateTime.parse(json['time'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      conditionCode: json['conditionCode'] as String,
      iconId: json['iconId'] as String,
    );

Map<String, dynamic> _$HourlyForecastToJson(_HourlyForecast instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature': instance.temperature,
      'conditionCode': instance.conditionCode,
      'iconId': instance.iconId,
    };

_WeatherSettings _$WeatherSettingsFromJson(Map<String, dynamic> json) =>
    _WeatherSettings(
      isCelsius: json['isCelsius'] as bool,
      selectedCityName: json['selectedCityName'] as String,
    );

Map<String, dynamic> _$WeatherSettingsToJson(_WeatherSettings instance) =>
    <String, dynamic>{
      'isCelsius': instance.isCelsius,
      'selectedCityName': instance.selectedCityName,
    };
