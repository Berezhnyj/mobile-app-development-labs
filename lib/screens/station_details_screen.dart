import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_lab1/widgets/info_tile.dart';
import 'package:flutter_lab1/widgets/notice_banner.dart';
import 'package:flutter_lab1/widgets/page_body.dart';
import 'package:flutter_lab1/widgets/responsive_grid.dart';
import 'package:flutter_lab1/widgets/section_header.dart';
import 'package:flutter_lab1/widgets/sensor_tile.dart';
import 'package:flutter_lab1/widgets/status_chip.dart';

/// Details of one station, opened from the dashboard with arguments.
class StationDetailsScreen extends StatelessWidget {
  const StationDetailsScreen({required this.station, super.key});

  final WeatherStation station;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(station.name)),
      body: PageBody(
        maxWidth: 900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!station.isOnline) ...[
              const NoticeBanner(
                message: 'Станція офлайн. Показано останні отримані дані.',
              ),
              const SizedBox(height: AppSpacing.m),
            ],
            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.place_outlined,
                    label: 'Розташування',
                    value: station.location,
                  ),
                  ListTile(
                    leading: const Icon(Icons.wifi_tethering),
                    title: const Text('Стан'),
                    trailing: StatusChip(isOnline: station.isOnline),
                  ),
                  InfoTile(
                    icon: Icons.battery_std,
                    label: 'Батарея',
                    value: '${station.battery}%',
                  ),
                  InfoTile(
                    icon: Icons.update,
                    label: 'Останнє оновлення',
                    value: station.lastUpdate,
                  ),
                ],
              ),
            ),
            const SectionHeader(title: 'Датчики'),
            ResponsiveGrid(
              children: [
                for (final reading in station.readings)
                  SensorTile(reading: reading),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
