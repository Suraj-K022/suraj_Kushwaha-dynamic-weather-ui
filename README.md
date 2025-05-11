# 🌦️ Dynamic Weather UI

A Flutter application showcasing a **visually appealing**, **interactive**, and **dynamic weather forecast UI** powered by **mocked data**. Built with advanced **Sliver-based layouts**, **theme changes based on weather**, **reactive forms**, and **persistent settings** using `shared_preferences`.

---

## 🚀 Features

- 🌡️ **Current Weather Panel**: CustomScrollView with a SliverAppBar showing the current city, temperature, and weather icon.
- 🕒 **Hourly Forecast Detail**: Detailed per-day view including hourly breakdown, UV index, precipitation, and sun cycle.
- 🔧 **Settings Screen**:
    - Toggle temperature units (°C / °F)
    - Change city from a list of 5 mock locations
    - Persist preferences using `shared_preferences`
- 🔍 **Advanced Search and Filtering**:
    - Rich-text editing using with `reactive_forms`

- 🎨 **Dynamic Theming**: Backgrounds and Images change with mock weather data.

---


## 🛠️ Tech Stack

- **Flutter** 3.27.1
- **Dart** 3.6.0
- `provider` for state management
- `auto_route` for type-safe navigation
- `get_it` for dependency injection
- `reactive_forms` for form management
- `hive` for local storage
- `freezed` + `json_serializable` for immutable data models
- `shared_preferences` for persistent settings


---


## ⚠️ Challenges Faced  

1. `Freezed Setup Errors`
   -- Faced "missing concrete implementation" errors due to incorrect part directives and build_runner usage. Fixed by ensuring correct annotations and regenerating files.
2. `Complex Toolchain`
   -- First time using multiple tools (freezed, json_serializable, reactive_forms, shared_preferences) together—required careful coordination and debugging.
3. `Dynamic Temperature Conversion`
   -- Implementing °C/°F switching throughout the app introduced challenges in maintaining consistency across widgets and persisted state.
4. `Learning AutoRoute`
   -- Faced a learning curve around route guards, nested routing, and passing models between screens with AutoRoute’s type-safe API.
5. `Mock Data Handling`
   -- Created mock data for multiple cities and ensured UI updated correctly with associated dynamic themes and forecasts.

## 📁 Folder Structure (Simplified)

```bash
lib/
│
├── assets/
│   └── images/                    # App image assets
│
├── core/
│   ├── model/                     # Shared data models (e.g., weather models)
│   ├── routes/                    # AutoRoute setup and configuration
│   ├── services/                  # Shared services (weather API, Hive, shared_preferences)
│   └── utils/                     # Extensions, helper functions
│
├── features/
│   └── weather/
│       └── presentation/
│           ├── screens/           # UI screens (SplashScreen, Home, Settings, ForecastDetail, HourlyDetail)
│           └── widgets/           # Reusable UI components (e.g., forecast cards, weather icons)
│
└── main.dart                      # App entry point
 
