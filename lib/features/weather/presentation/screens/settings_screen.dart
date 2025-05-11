import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/settings_storage.dart';
import '../../../../core/models/weather_model.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsService settingsService;

  final form = FormGroup({
    'isCelsius': FormControl<bool>(value: true),
    'selectedCity': FormControl<String>(value: 'New York'),
  });

  List<DailyForecast> forecast = [];

  @override
  void initState() {
    super.initState();
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
    });
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
        leading: InkWell(onTap: ()=> Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 24,color: Colors.black,)),
        title: const Text('Settings'),
        backgroundColor: Colors.lightBlue[100], // Very light blue
      ),
      backgroundColor: Colors.lightBlue[100], // Very light blue for the background
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ReactiveSwitchListTile(
                formControlName: 'isCelsius',
                activeColor: Colors.blue,
                title: const Text('Temperature Unit'),
                subtitle: ReactiveValueListenableBuilder<bool>(formControlName: 'isCelsius', builder: (context, control, _) {
                  return Text(control.value! ? 'Celsius' : 'Fahrenheit');
                }),
              ),
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
              ),
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
                ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
