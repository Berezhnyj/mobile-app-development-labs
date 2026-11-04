import 'package:flutter/widgets.dart';

/// Single sensor value, e.g. temperature or humidity.
class SensorReading {
  const SensorReading({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
  });

  final String label;
  final String value;
  final String unit;
  final IconData icon;
}

/// IoT weather station with its latest readings.
class WeatherStation {
  const WeatherStation({
    required this.id,
    required this.name,
    required this.location,
    required this.isOnline,
    required this.lastUpdate,
    required this.battery,
    required this.readings,
  });

  final String id;
  final String name;
  final String location;
  final bool isOnline;
  final String lastUpdate;
  final int battery;
  final List<SensorReading> readings;
}
