import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/forecast.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/widgets/current_weather_card.dart';
import 'package:flutter_lab1/widgets/hourly_forecast_strip.dart';
import 'package:flutter_lab1/widgets/responsive_grid.dart';
import 'package:flutter_lab1/widgets/section_header.dart';
import 'package:flutter_lab1/widgets/sensor_tile.dart';

/// Left part of the dashboard: current weather, forecast, sensors.
class DashboardOverview extends StatelessWidget {
  const DashboardOverview({
    required this.conditions,
    required this.hourly,
    required this.readings,
    super.key,
  });

  final CurrentConditions conditions;
  final List<HourlyForecast> hourly;
  final List<SensorReading> readings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurrentWeatherCard(conditions: conditions),
        const SectionHeader(title: 'Прогноз на сьогодні'),
        HourlyForecastStrip(items: hourly),
        const SectionHeader(title: 'Показники головної станції'),
        ResponsiveGrid(
          children: [
            for (final reading in readings) SensorTile(reading: reading),
          ],
        ),
      ],
    );
  }
}
