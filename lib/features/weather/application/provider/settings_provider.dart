import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  late SharedPreferences _prefs;
  bool _isCelsius = true;
  String _selectedCity = 'New York';

  bool get isCelsius => _isCelsius;
  String get selectedCity => _selectedCity;

  // Load settings from SharedPreferences
  Future<bool> loadSettings() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _isCelsius = _prefs.getBool('isCelsius') ?? true;
      _selectedCity = _prefs.getString('selectedCity') ?? 'New York';
      notifyListeners();
      return true; // Successfully loaded settings
    } catch (e) {
      print('Error loading settings: $e');
      return false; // Error in loading settings
    }
  }

  // Save settings to SharedPreferences
  Future<void> saveSettings(UserSettings settings) async {
    try {
      _isCelsius = settings.isCelsius;
      _selectedCity = settings.selectedCity;
      await _prefs.setBool('isCelsius', _isCelsius);
      await _prefs.setString('selectedCity', _selectedCity);
      notifyListeners();
    } catch (e) {
      print('Error saving settings: $e');
    }
  }
}

class UserSettings {
  final bool isCelsius;
  final String selectedCity;

  UserSettings({required this.isCelsius, required this.selectedCity});
}
