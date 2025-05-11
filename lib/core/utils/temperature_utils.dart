class TemperatureUtils {
  static double toCelsius(double fahrenheit) {
    return ((fahrenheit - 32) * 5 / 9);
  }

  static double toFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32);
  }

  static double format(double value) {
    return double.parse(value.toStringAsFixed(1));
  }
}
