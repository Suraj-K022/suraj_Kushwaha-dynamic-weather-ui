// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppWeatherData {
  CurrentWeather get currentWeather;
  List<DailyForecast> get sevenDayForecast;
  WeatherSettings get appSettings;

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppWeatherDataCopyWith<AppWeatherData> get copyWith =>
      _$AppWeatherDataCopyWithImpl<AppWeatherData>(
          this as AppWeatherData, _$identity);

  /// Serializes this AppWeatherData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppWeatherData &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            const DeepCollectionEquality()
                .equals(other.sevenDayForecast, sevenDayForecast) &&
            (identical(other.appSettings, appSettings) ||
                other.appSettings == appSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentWeather,
      const DeepCollectionEquality().hash(sevenDayForecast), appSettings);

  @override
  String toString() {
    return 'AppWeatherData(currentWeather: $currentWeather, sevenDayForecast: $sevenDayForecast, appSettings: $appSettings)';
  }
}

/// @nodoc
abstract mixin class $AppWeatherDataCopyWith<$Res> {
  factory $AppWeatherDataCopyWith(
          AppWeatherData value, $Res Function(AppWeatherData) _then) =
      _$AppWeatherDataCopyWithImpl;
  @useResult
  $Res call(
      {CurrentWeather currentWeather,
      List<DailyForecast> sevenDayForecast,
      WeatherSettings appSettings});

  $CurrentWeatherCopyWith<$Res> get currentWeather;
  $WeatherSettingsCopyWith<$Res> get appSettings;
}

/// @nodoc
class _$AppWeatherDataCopyWithImpl<$Res>
    implements $AppWeatherDataCopyWith<$Res> {
  _$AppWeatherDataCopyWithImpl(this._self, this._then);

  final AppWeatherData _self;
  final $Res Function(AppWeatherData) _then;

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeather = null,
    Object? sevenDayForecast = null,
    Object? appSettings = null,
  }) {
    return _then(_self.copyWith(
      currentWeather: null == currentWeather
          ? _self.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather,
      sevenDayForecast: null == sevenDayForecast
          ? _self.sevenDayForecast
          : sevenDayForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast>,
      appSettings: null == appSettings
          ? _self.appSettings
          : appSettings // ignore: cast_nullable_to_non_nullable
              as WeatherSettings,
    ));
  }

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<$Res> get currentWeather {
    return $CurrentWeatherCopyWith<$Res>(_self.currentWeather, (value) {
      return _then(_self.copyWith(currentWeather: value));
    });
  }

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherSettingsCopyWith<$Res> get appSettings {
    return $WeatherSettingsCopyWith<$Res>(_self.appSettings, (value) {
      return _then(_self.copyWith(appSettings: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AppWeatherData implements AppWeatherData {
  const _AppWeatherData(
      {required this.currentWeather,
      required final List<DailyForecast> sevenDayForecast,
      required this.appSettings})
      : _sevenDayForecast = sevenDayForecast;
  factory _AppWeatherData.fromJson(Map<String, dynamic> json) =>
      _$AppWeatherDataFromJson(json);

  @override
  final CurrentWeather currentWeather;
  final List<DailyForecast> _sevenDayForecast;
  @override
  List<DailyForecast> get sevenDayForecast {
    if (_sevenDayForecast is EqualUnmodifiableListView)
      return _sevenDayForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sevenDayForecast);
  }

  @override
  final WeatherSettings appSettings;

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppWeatherDataCopyWith<_AppWeatherData> get copyWith =>
      __$AppWeatherDataCopyWithImpl<_AppWeatherData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppWeatherDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppWeatherData &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            const DeepCollectionEquality()
                .equals(other._sevenDayForecast, _sevenDayForecast) &&
            (identical(other.appSettings, appSettings) ||
                other.appSettings == appSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentWeather,
      const DeepCollectionEquality().hash(_sevenDayForecast), appSettings);

  @override
  String toString() {
    return 'AppWeatherData(currentWeather: $currentWeather, sevenDayForecast: $sevenDayForecast, appSettings: $appSettings)';
  }
}

/// @nodoc
abstract mixin class _$AppWeatherDataCopyWith<$Res>
    implements $AppWeatherDataCopyWith<$Res> {
  factory _$AppWeatherDataCopyWith(
          _AppWeatherData value, $Res Function(_AppWeatherData) _then) =
      __$AppWeatherDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CurrentWeather currentWeather,
      List<DailyForecast> sevenDayForecast,
      WeatherSettings appSettings});

  @override
  $CurrentWeatherCopyWith<$Res> get currentWeather;
  @override
  $WeatherSettingsCopyWith<$Res> get appSettings;
}

/// @nodoc
class __$AppWeatherDataCopyWithImpl<$Res>
    implements _$AppWeatherDataCopyWith<$Res> {
  __$AppWeatherDataCopyWithImpl(this._self, this._then);

  final _AppWeatherData _self;
  final $Res Function(_AppWeatherData) _then;

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentWeather = null,
    Object? sevenDayForecast = null,
    Object? appSettings = null,
  }) {
    return _then(_AppWeatherData(
      currentWeather: null == currentWeather
          ? _self.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather,
      sevenDayForecast: null == sevenDayForecast
          ? _self._sevenDayForecast
          : sevenDayForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast>,
      appSettings: null == appSettings
          ? _self.appSettings
          : appSettings // ignore: cast_nullable_to_non_nullable
              as WeatherSettings,
    ));
  }

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<$Res> get currentWeather {
    return $CurrentWeatherCopyWith<$Res>(_self.currentWeather, (value) {
      return _then(_self.copyWith(currentWeather: value));
    });
  }

  /// Create a copy of AppWeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherSettingsCopyWith<$Res> get appSettings {
    return $WeatherSettingsCopyWith<$Res>(_self.appSettings, (value) {
      return _then(_self.copyWith(appSettings: value));
    });
  }
}

/// @nodoc
mixin _$CurrentWeather {
  String get city;
  double get temperature;
  String get conditionCode;
  String get conditionDescription;
  int get humidity;
  double get windSpeed;
  String get windDirection;
  double get feelsLike;
  double get pressure;
  double get visibility;
  String get iconId;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      _$CurrentWeatherCopyWithImpl<CurrentWeather>(
          this as CurrentWeather, _$identity);

  /// Serializes this CurrentWeather to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrentWeather &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.conditionDescription, conditionDescription) ||
                other.conditionDescription == conditionDescription) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windDirection, windDirection) ||
                other.windDirection == windDirection) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.iconId, iconId) || other.iconId == iconId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      city,
      temperature,
      conditionCode,
      conditionDescription,
      humidity,
      windSpeed,
      windDirection,
      feelsLike,
      pressure,
      visibility,
      iconId);

  @override
  String toString() {
    return 'CurrentWeather(city: $city, temperature: $temperature, conditionCode: $conditionCode, conditionDescription: $conditionDescription, humidity: $humidity, windSpeed: $windSpeed, windDirection: $windDirection, feelsLike: $feelsLike, pressure: $pressure, visibility: $visibility, iconId: $iconId)';
  }
}

/// @nodoc
abstract mixin class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
          CurrentWeather value, $Res Function(CurrentWeather) _then) =
      _$CurrentWeatherCopyWithImpl;
  @useResult
  $Res call(
      {String city,
      double temperature,
      String conditionCode,
      String conditionDescription,
      int humidity,
      double windSpeed,
      String windDirection,
      double feelsLike,
      double pressure,
      double visibility,
      String iconId});
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._self, this._then);

  final CurrentWeather _self;
  final $Res Function(CurrentWeather) _then;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? temperature = null,
    Object? conditionCode = null,
    Object? conditionDescription = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? feelsLike = null,
    Object? pressure = null,
    Object? visibility = null,
    Object? iconId = null,
  }) {
    return _then(_self.copyWith(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      conditionDescription: null == conditionDescription
          ? _self.conditionDescription
          : conditionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: null == windDirection
          ? _self.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: null == feelsLike
          ? _self.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CurrentWeather implements CurrentWeather {
  const _CurrentWeather(
      {required this.city,
      required this.temperature,
      required this.conditionCode,
      required this.conditionDescription,
      required this.humidity,
      required this.windSpeed,
      required this.windDirection,
      required this.feelsLike,
      required this.pressure,
      required this.visibility,
      required this.iconId});
  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  @override
  final String city;
  @override
  final double temperature;
  @override
  final String conditionCode;
  @override
  final String conditionDescription;
  @override
  final int humidity;
  @override
  final double windSpeed;
  @override
  final String windDirection;
  @override
  final double feelsLike;
  @override
  final double pressure;
  @override
  final double visibility;
  @override
  final String iconId;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrentWeatherCopyWith<_CurrentWeather> get copyWith =>
      __$CurrentWeatherCopyWithImpl<_CurrentWeather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrentWeatherToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentWeather &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.conditionDescription, conditionDescription) ||
                other.conditionDescription == conditionDescription) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windDirection, windDirection) ||
                other.windDirection == windDirection) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.iconId, iconId) || other.iconId == iconId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      city,
      temperature,
      conditionCode,
      conditionDescription,
      humidity,
      windSpeed,
      windDirection,
      feelsLike,
      pressure,
      visibility,
      iconId);

  @override
  String toString() {
    return 'CurrentWeather(city: $city, temperature: $temperature, conditionCode: $conditionCode, conditionDescription: $conditionDescription, humidity: $humidity, windSpeed: $windSpeed, windDirection: $windDirection, feelsLike: $feelsLike, pressure: $pressure, visibility: $visibility, iconId: $iconId)';
  }
}

/// @nodoc
abstract mixin class _$CurrentWeatherCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$CurrentWeatherCopyWith(
          _CurrentWeather value, $Res Function(_CurrentWeather) _then) =
      __$CurrentWeatherCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String city,
      double temperature,
      String conditionCode,
      String conditionDescription,
      int humidity,
      double windSpeed,
      String windDirection,
      double feelsLike,
      double pressure,
      double visibility,
      String iconId});
}

/// @nodoc
class __$CurrentWeatherCopyWithImpl<$Res>
    implements _$CurrentWeatherCopyWith<$Res> {
  __$CurrentWeatherCopyWithImpl(this._self, this._then);

  final _CurrentWeather _self;
  final $Res Function(_CurrentWeather) _then;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = null,
    Object? temperature = null,
    Object? conditionCode = null,
    Object? conditionDescription = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? feelsLike = null,
    Object? pressure = null,
    Object? visibility = null,
    Object? iconId = null,
  }) {
    return _then(_CurrentWeather(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      conditionDescription: null == conditionDescription
          ? _self.conditionDescription
          : conditionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: null == windDirection
          ? _self.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String,
      feelsLike: null == feelsLike
          ? _self.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _self.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DailyForecast {
  DateTime get date;
  double get highTemp;
  double get lowTemp;
  String get conditionCode;
  String get conditionDescription;
  String get iconId;
  List<HourlyForecast> get hourlyForecasts;
  double get precipitationProbability;
  int get uvIndex;
  DateTime get sunrise;
  DateTime get sunset;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DailyForecastCopyWith<DailyForecast> get copyWith =>
      _$DailyForecastCopyWithImpl<DailyForecast>(
          this as DailyForecast, _$identity);

  /// Serializes this DailyForecast to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyForecast &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.highTemp, highTemp) ||
                other.highTemp == highTemp) &&
            (identical(other.lowTemp, lowTemp) || other.lowTemp == lowTemp) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.conditionDescription, conditionDescription) ||
                other.conditionDescription == conditionDescription) &&
            (identical(other.iconId, iconId) || other.iconId == iconId) &&
            const DeepCollectionEquality()
                .equals(other.hourlyForecasts, hourlyForecasts) &&
            (identical(
                    other.precipitationProbability, precipitationProbability) ||
                other.precipitationProbability == precipitationProbability) &&
            (identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      highTemp,
      lowTemp,
      conditionCode,
      conditionDescription,
      iconId,
      const DeepCollectionEquality().hash(hourlyForecasts),
      precipitationProbability,
      uvIndex,
      sunrise,
      sunset);

  @override
  String toString() {
    return 'DailyForecast(date: $date, highTemp: $highTemp, lowTemp: $lowTemp, conditionCode: $conditionCode, conditionDescription: $conditionDescription, iconId: $iconId, hourlyForecasts: $hourlyForecasts, precipitationProbability: $precipitationProbability, uvIndex: $uvIndex, sunrise: $sunrise, sunset: $sunset)';
  }
}

/// @nodoc
abstract mixin class $DailyForecastCopyWith<$Res> {
  factory $DailyForecastCopyWith(
          DailyForecast value, $Res Function(DailyForecast) _then) =
      _$DailyForecastCopyWithImpl;
  @useResult
  $Res call(
      {DateTime date,
      double highTemp,
      double lowTemp,
      String conditionCode,
      String conditionDescription,
      String iconId,
      List<HourlyForecast> hourlyForecasts,
      double precipitationProbability,
      int uvIndex,
      DateTime sunrise,
      DateTime sunset});
}

/// @nodoc
class _$DailyForecastCopyWithImpl<$Res>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._self, this._then);

  final DailyForecast _self;
  final $Res Function(DailyForecast) _then;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? highTemp = null,
    Object? lowTemp = null,
    Object? conditionCode = null,
    Object? conditionDescription = null,
    Object? iconId = null,
    Object? hourlyForecasts = null,
    Object? precipitationProbability = null,
    Object? uvIndex = null,
    Object? sunrise = null,
    Object? sunset = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      highTemp: null == highTemp
          ? _self.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as double,
      lowTemp: null == lowTemp
          ? _self.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      conditionDescription: null == conditionDescription
          ? _self.conditionDescription
          : conditionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyForecasts: null == hourlyForecasts
          ? _self.hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      precipitationProbability: null == precipitationProbability
          ? _self.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _self.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sunrise: null == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DailyForecast implements DailyForecast {
  const _DailyForecast(
      {required this.date,
      required this.highTemp,
      required this.lowTemp,
      required this.conditionCode,
      required this.conditionDescription,
      required this.iconId,
      required final List<HourlyForecast> hourlyForecasts,
      required this.precipitationProbability,
      required this.uvIndex,
      required this.sunrise,
      required this.sunset})
      : _hourlyForecasts = hourlyForecasts;
  factory _DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);

  @override
  final DateTime date;
  @override
  final double highTemp;
  @override
  final double lowTemp;
  @override
  final String conditionCode;
  @override
  final String conditionDescription;
  @override
  final String iconId;
  final List<HourlyForecast> _hourlyForecasts;
  @override
  List<HourlyForecast> get hourlyForecasts {
    if (_hourlyForecasts is EqualUnmodifiableListView) return _hourlyForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  final double precipitationProbability;
  @override
  final int uvIndex;
  @override
  final DateTime sunrise;
  @override
  final DateTime sunset;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DailyForecastCopyWith<_DailyForecast> get copyWith =>
      __$DailyForecastCopyWithImpl<_DailyForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DailyForecastToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyForecast &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.highTemp, highTemp) ||
                other.highTemp == highTemp) &&
            (identical(other.lowTemp, lowTemp) || other.lowTemp == lowTemp) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.conditionDescription, conditionDescription) ||
                other.conditionDescription == conditionDescription) &&
            (identical(other.iconId, iconId) || other.iconId == iconId) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecasts, _hourlyForecasts) &&
            (identical(
                    other.precipitationProbability, precipitationProbability) ||
                other.precipitationProbability == precipitationProbability) &&
            (identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      highTemp,
      lowTemp,
      conditionCode,
      conditionDescription,
      iconId,
      const DeepCollectionEquality().hash(_hourlyForecasts),
      precipitationProbability,
      uvIndex,
      sunrise,
      sunset);

  @override
  String toString() {
    return 'DailyForecast(date: $date, highTemp: $highTemp, lowTemp: $lowTemp, conditionCode: $conditionCode, conditionDescription: $conditionDescription, iconId: $iconId, hourlyForecasts: $hourlyForecasts, precipitationProbability: $precipitationProbability, uvIndex: $uvIndex, sunrise: $sunrise, sunset: $sunset)';
  }
}

/// @nodoc
abstract mixin class _$DailyForecastCopyWith<$Res>
    implements $DailyForecastCopyWith<$Res> {
  factory _$DailyForecastCopyWith(
          _DailyForecast value, $Res Function(_DailyForecast) _then) =
      __$DailyForecastCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double highTemp,
      double lowTemp,
      String conditionCode,
      String conditionDescription,
      String iconId,
      List<HourlyForecast> hourlyForecasts,
      double precipitationProbability,
      int uvIndex,
      DateTime sunrise,
      DateTime sunset});
}

/// @nodoc
class __$DailyForecastCopyWithImpl<$Res>
    implements _$DailyForecastCopyWith<$Res> {
  __$DailyForecastCopyWithImpl(this._self, this._then);

  final _DailyForecast _self;
  final $Res Function(_DailyForecast) _then;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? highTemp = null,
    Object? lowTemp = null,
    Object? conditionCode = null,
    Object? conditionDescription = null,
    Object? iconId = null,
    Object? hourlyForecasts = null,
    Object? precipitationProbability = null,
    Object? uvIndex = null,
    Object? sunrise = null,
    Object? sunset = null,
  }) {
    return _then(_DailyForecast(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      highTemp: null == highTemp
          ? _self.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as double,
      lowTemp: null == lowTemp
          ? _self.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      conditionDescription: null == conditionDescription
          ? _self.conditionDescription
          : conditionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
      hourlyForecasts: null == hourlyForecasts
          ? _self._hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      precipitationProbability: null == precipitationProbability
          ? _self.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _self.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sunrise: null == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$HourlyForecast {
  DateTime get time;
  double get temperature;
  String get conditionCode;
  String get iconId;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HourlyForecastCopyWith<HourlyForecast> get copyWith =>
      _$HourlyForecastCopyWithImpl<HourlyForecast>(
          this as HourlyForecast, _$identity);

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HourlyForecast &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.iconId, iconId) || other.iconId == iconId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, temperature, conditionCode, iconId);

  @override
  String toString() {
    return 'HourlyForecast(time: $time, temperature: $temperature, conditionCode: $conditionCode, iconId: $iconId)';
  }
}

/// @nodoc
abstract mixin class $HourlyForecastCopyWith<$Res> {
  factory $HourlyForecastCopyWith(
          HourlyForecast value, $Res Function(HourlyForecast) _then) =
      _$HourlyForecastCopyWithImpl;
  @useResult
  $Res call(
      {DateTime time, double temperature, String conditionCode, String iconId});
}

/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._self, this._then);

  final HourlyForecast _self;
  final $Res Function(HourlyForecast) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? conditionCode = null,
    Object? iconId = null,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HourlyForecast implements HourlyForecast {
  const _HourlyForecast(
      {required this.time,
      required this.temperature,
      required this.conditionCode,
      required this.iconId});
  factory _HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);

  @override
  final DateTime time;
  @override
  final double temperature;
  @override
  final String conditionCode;
  @override
  final String iconId;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HourlyForecastCopyWith<_HourlyForecast> get copyWith =>
      __$HourlyForecastCopyWithImpl<_HourlyForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HourlyForecastToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HourlyForecast &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.conditionCode, conditionCode) ||
                other.conditionCode == conditionCode) &&
            (identical(other.iconId, iconId) || other.iconId == iconId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, temperature, conditionCode, iconId);

  @override
  String toString() {
    return 'HourlyForecast(time: $time, temperature: $temperature, conditionCode: $conditionCode, iconId: $iconId)';
  }
}

/// @nodoc
abstract mixin class _$HourlyForecastCopyWith<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  factory _$HourlyForecastCopyWith(
          _HourlyForecast value, $Res Function(_HourlyForecast) _then) =
      __$HourlyForecastCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime time, double temperature, String conditionCode, String iconId});
}

/// @nodoc
class __$HourlyForecastCopyWithImpl<$Res>
    implements _$HourlyForecastCopyWith<$Res> {
  __$HourlyForecastCopyWithImpl(this._self, this._then);

  final _HourlyForecast _self;
  final $Res Function(_HourlyForecast) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? conditionCode = null,
    Object? iconId = null,
  }) {
    return _then(_HourlyForecast(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditionCode: null == conditionCode
          ? _self.conditionCode
          : conditionCode // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: null == iconId
          ? _self.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WeatherSettings {
  bool get isCelsius;
  String get selectedCityName;

  /// Create a copy of WeatherSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherSettingsCopyWith<WeatherSettings> get copyWith =>
      _$WeatherSettingsCopyWithImpl<WeatherSettings>(
          this as WeatherSettings, _$identity);

  /// Serializes this WeatherSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherSettings &&
            (identical(other.isCelsius, isCelsius) ||
                other.isCelsius == isCelsius) &&
            (identical(other.selectedCityName, selectedCityName) ||
                other.selectedCityName == selectedCityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isCelsius, selectedCityName);

  @override
  String toString() {
    return 'WeatherSettings(isCelsius: $isCelsius, selectedCityName: $selectedCityName)';
  }
}

/// @nodoc
abstract mixin class $WeatherSettingsCopyWith<$Res> {
  factory $WeatherSettingsCopyWith(
          WeatherSettings value, $Res Function(WeatherSettings) _then) =
      _$WeatherSettingsCopyWithImpl;
  @useResult
  $Res call({bool isCelsius, String selectedCityName});
}

/// @nodoc
class _$WeatherSettingsCopyWithImpl<$Res>
    implements $WeatherSettingsCopyWith<$Res> {
  _$WeatherSettingsCopyWithImpl(this._self, this._then);

  final WeatherSettings _self;
  final $Res Function(WeatherSettings) _then;

  /// Create a copy of WeatherSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCelsius = null,
    Object? selectedCityName = null,
  }) {
    return _then(_self.copyWith(
      isCelsius: null == isCelsius
          ? _self.isCelsius
          : isCelsius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCityName: null == selectedCityName
          ? _self.selectedCityName
          : selectedCityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherSettings implements WeatherSettings {
  const _WeatherSettings(
      {required this.isCelsius, required this.selectedCityName});
  factory _WeatherSettings.fromJson(Map<String, dynamic> json) =>
      _$WeatherSettingsFromJson(json);

  @override
  final bool isCelsius;
  @override
  final String selectedCityName;

  /// Create a copy of WeatherSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherSettingsCopyWith<_WeatherSettings> get copyWith =>
      __$WeatherSettingsCopyWithImpl<_WeatherSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherSettings &&
            (identical(other.isCelsius, isCelsius) ||
                other.isCelsius == isCelsius) &&
            (identical(other.selectedCityName, selectedCityName) ||
                other.selectedCityName == selectedCityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isCelsius, selectedCityName);

  @override
  String toString() {
    return 'WeatherSettings(isCelsius: $isCelsius, selectedCityName: $selectedCityName)';
  }
}

/// @nodoc
abstract mixin class _$WeatherSettingsCopyWith<$Res>
    implements $WeatherSettingsCopyWith<$Res> {
  factory _$WeatherSettingsCopyWith(
          _WeatherSettings value, $Res Function(_WeatherSettings) _then) =
      __$WeatherSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({bool isCelsius, String selectedCityName});
}

/// @nodoc
class __$WeatherSettingsCopyWithImpl<$Res>
    implements _$WeatherSettingsCopyWith<$Res> {
  __$WeatherSettingsCopyWithImpl(this._self, this._then);

  final _WeatherSettings _self;
  final $Res Function(_WeatherSettings) _then;

  /// Create a copy of WeatherSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isCelsius = null,
    Object? selectedCityName = null,
  }) {
    return _then(_WeatherSettings(
      isCelsius: null == isCelsius
          ? _self.isCelsius
          : isCelsius // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCityName: null == selectedCityName
          ? _self.selectedCityName
          : selectedCityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
