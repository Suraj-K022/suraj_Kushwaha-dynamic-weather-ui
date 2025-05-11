import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  bool isCelsius = true;
  String selectedCity = 'New York';

  // Load from SharedPreferences
  Future<void> loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Using UserSettings to simplify loading settings
      isCelsius = prefs.getBool('isCelsius') ?? true;
      selectedCity = prefs.getString('selectedCity') ?? 'New York';
      notifyListeners();
    } catch (error) {
      print('Error loading settings: $error');
    }
  }

  // Save to SharedPreferences
  Future<void> saveSettings(UserSettings newSettings) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Save using UserSettings properties directly
      await prefs.setBool('isCelsius', newSettings.isCelsius);
      await prefs.setString('selectedCity', newSettings.selectedCity);

      // Update in-memory state
      isCelsius = newSettings.isCelsius;
      selectedCity = newSettings.selectedCity;

      notifyListeners();
    } catch (error) {
      print('Error saving settings: $error');
    }
  }
}

class UserSettings {
  final bool isCelsius;
  final String selectedCity;

  UserSettings({required this.isCelsius, required this.selectedCity});

  // Optionally, you can add a `toMap()` and `fromMap()` method if needed
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
