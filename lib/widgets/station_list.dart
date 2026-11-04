import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_lab1/widgets/coming_soon.dart';
import 'package:flutter_lab1/widgets/section_header.dart';
import 'package:flutter_lab1/widgets/station_card.dart';

/// "My stations" section of the dashboard.
class StationList extends StatelessWidget {
  const StationList({
    required this.stations,
    required this.onStationTap,
    super.key,
  });

  final List<WeatherStation> stations;
  final ValueChanged<WeatherStation> onStationTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.s,
      children: [
        SectionHeader(
          title: 'Мої станції',
          actionLabel: 'Додати',
          onAction: () => showComingSoon(context),
        ),
        for (final station in stations)
          StationCard(station: station, onTap: () => onStationTap(station)),
      ],
    );
  }
}
