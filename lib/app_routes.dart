import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/screens/login_screen.dart';
import 'package:flutter_lab1/screens/main_screen.dart';
import 'package:flutter_lab1/screens/registration_screen.dart';
import 'package:flutter_lab1/screens/station_details_screen.dart';
import 'package:flutter_lab1/screens/user_profile_screen.dart';

/// Named routes of the app (Navigator 1.0).
abstract final class AppRoutes {
  static const login = '/';
  static const registration = '/registration';
  static const main = '/main';
  static const profile = '/profile';
  static const stationDetails = '/station';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      registration => const RegistrationScreen(),
      main => const MainScreen(),
      profile => const UserProfileScreen(),
      stationDetails => StationDetailsScreen(
        station: settings.arguments! as WeatherStation,
      ),
      _ => const LoginScreen(),
    };

    return MaterialPageRoute<void>(builder: (_) => page, settings: settings);
  }
}
