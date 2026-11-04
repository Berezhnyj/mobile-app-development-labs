import 'package:flutter/widgets.dart';

/// Current conditions shown at the top of the dashboard.
class CurrentConditions {
  const CurrentConditions({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.feelsLike,
    required this.high,
    required this.low,
    required this.icon,
  });

  final String location;
  final int temperature;
  final String condition;
  final int feelsLike;
  final int high;
  final int low;
  final IconData icon;
}

/// Forecast for a single hour.
class HourlyForecast {
  const HourlyForecast({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  final String time;
  final int temperature;
  final IconData icon;
}
