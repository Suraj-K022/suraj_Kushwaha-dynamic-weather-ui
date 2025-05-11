import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/settings_storage.dart';
import '../../../../core/models/weather_model.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late SettingsService settingsService;
  final form = FormGroup({
    'isCelsius': FormControl<bool>(value: true),
    'selectedCity': FormControl<String>(value: 'New York'),
  });

  List<DailyForecast> forecast = [];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      settingsService = Provider.of<SettingsService>(context, listen: false);
      await settingsService.loadSettings();
      form.control('isCelsius').value = settingsService.isCelsius;
      form.control('selectedCity').value = settingsService.selectedCity;

      forecast = List.generate(7, (index) {
        final date = DateTime.now().add(Duration(days: index));
        return DailyForecast(
          date: date,
          highTemp: 25 + index.toDouble(),
          lowTemp: 15 + index.toDouble(),
          conditionCode: 'clear',
          conditionDescription: 'Clear skies',
          iconId: '01d',
          precipitationProbability: 0.1 * index,
          uvIndex: 5 + index,
          sunrise: date.copyWith(hour: 6),
          sunset: date.copyWith(hour: 18),
          hourlyForecasts: List.generate(24, (hour) {
            return HourlyForecast(
              time: date.copyWith(hour: hour),
              temperature: 15 + hour.toDouble() / 2,
              conditionCode: 'clear',
              iconId: '01d',
            );
          }),
        );
      });

      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveSettingsAndNavigate() async {
    final isCelsius = form.control('isCelsius').value as bool;
    final selectedCity = form.control('selectedCity').value as String;

    await settingsService.saveSettings(
      UserSettings(
        isCelsius: isCelsius,
        selectedCity: selectedCity,
      ),
    );

    context.router.replace(WeatherHomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new_outlined, size: 24, color: Colors.black),
        ),
        title: const Text('Settings'),
        backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.lightBlue[100],
      body: FadeTransition(
        opacity: _controller.drive(CurveTween(curve: Curves.easeIn)),
        child: ReactiveForm(
          formGroup: form,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ReactiveSwitchListTile(
                  formControlName: 'isCelsius',
                  activeColor: Colors.blue,
                  title: const Text('Temperature Unit'),
                  subtitle: ReactiveValueListenableBuilder<bool>(
                    formControlName: 'isCelsius',
                    builder: (context, control, _) {
                      return Text(control.value! ? 'Celsius' : 'Fahrenheit');
                    },
                  ),
                ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),
                const SizedBox(height: 20),
                ReactiveDropdownField<String>(
                  formControlName: 'selectedCity',
                  decoration: const InputDecoration(
                    labelText: 'Select City',
                    border: OutlineInputBorder(),
                  ),
                  items: ['New York', 'London', 'Tokyo', 'Paris', 'Sydney']
                      .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                      .toList(),
                ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _saveSettingsAndNavigate,
                    label: const Text('Save Settings', style: TextStyle(fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (forecast.isNotEmpty) {
                        context.router.push(
                          ForecastDetailRoute(
                            dayIndex: 2,
                            forecast: forecast,
                          ),
                        );
                      }
                    },
                    child: const Text('View Forecast Detail', style: TextStyle(fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
