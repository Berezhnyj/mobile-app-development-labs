import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/forecast.dart';
import 'package:flutter_lab1/models/user_profile.dart';
import 'package:flutter_lab1/models/weather_station.dart';

/// Static placeholder data until the REST/MQTT layer is implemented.
abstract final class MockData {
  static const user = UserProfile(
    name: "Артемій Гап'як",
    email: 'artemii@example.com',
    phone: '+380 67 123 45 67',
    city: 'Львів',
    memberSince: 'вересень 2026',
  );

  static const current = CurrentConditions(
    location: 'Львів, Сихів',
    temperature: 18,
    condition: 'Мінлива хмарність',
    feelsLike: 16,
    high: 21,
    low: 11,
    icon: Icons.wb_cloudy_outlined,
  );

  static const hourly = [
    HourlyForecast(time: 'Зараз', temperature: 18, icon: Icons.wb_cloudy),
    HourlyForecast(time: '13:00', temperature: 19, icon: Icons.wb_sunny),
    HourlyForecast(time: '14:00', temperature: 21, icon: Icons.wb_sunny),
    HourlyForecast(time: '15:00', temperature: 20, icon: Icons.cloud),
    HourlyForecast(time: '16:00', temperature: 17, icon: Icons.grain),
    HourlyForecast(time: '17:00', temperature: 15, icon: Icons.grain),
    HourlyForecast(time: '18:00', temperature: 14, icon: Icons.cloud),
  ];

  static final stations = [
    WeatherStation(
      id: 'ws-01',
      name: 'Двір',
      location: 'Львів, Сихів',
      isOnline: true,
      lastUpdate: '2 хв тому',
      battery: 87,
      readings: _readings('18.4', '62', '1013', '4.2'),
    ),
    WeatherStation(
      id: 'ws-02',
      name: 'Дах офісу',
      location: 'Львів, Центр',
      isOnline: true,
      lastUpdate: '5 хв тому',
      battery: 64,
      readings: _readings('17.1', '58', '1012', '6.8'),
    ),
    WeatherStation(
      id: 'ws-03',
      name: 'Дача',
      location: 'Пустомити',
      isOnline: false,
      lastUpdate: '3 год тому',
      battery: 12,
      readings: _readings('15.9', '71', '1011', '2.1'),
    ),
  ];

  static List<SensorReading> _readings(
    String temperature,
    String humidity,
    String pressure,
    String wind,
  ) => [
    SensorReading(
      label: 'Температура',
      value: temperature,
      unit: '°C',
      icon: Icons.thermostat,
    ),
    SensorReading(
      label: 'Вологість',
      value: humidity,
      unit: '%',
      icon: Icons.water_drop_outlined,
    ),
    SensorReading(
      label: 'Тиск',
      value: pressure,
      unit: 'гПа',
      icon: Icons.speed,
    ),
    SensorReading(label: 'Вітер', value: wind, unit: 'м/с', icon: Icons.air),
    const SensorReading(
      label: 'УФ-індекс',
      value: '3',
      unit: '',
      icon: Icons.wb_sunny_outlined,
    ),
    const SensorReading(
      label: 'PM2.5',
      value: '12',
      unit: 'мкг/м³',
      icon: Icons.blur_on,
    ),
  ];
}
