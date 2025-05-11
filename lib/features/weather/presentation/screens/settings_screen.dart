import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/storage/settings_storage.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      settingsService = Provider.of<SettingsService>(context, listen: false);
      await settingsService.loadSettings();
      form.control('isCelsius').value = settingsService.isCelsius;
      form.control('selectedCity').value = settingsService.selectedCity;
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
      appBar: AppBar(title: const Text('Settings')),
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ReactiveSwitchListTile(
                formControlName: 'isCelsius',
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
              ElevatedButton.icon(
                onPressed: _saveSettingsAndNavigate,
                label: const Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
