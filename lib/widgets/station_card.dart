import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_lab1/widgets/status_chip.dart';

/// Tappable card with a station's name, location, status and battery.
class StationCard extends StatelessWidget {
  const StationCard({required this.station, required this.onTap, super.key});

  final WeatherStation station;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final muted = theme.textTheme.bodySmall?.copyWith(
      color: scheme.onSurfaceVariant,
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Row(
            spacing: AppSpacing.m,
            children: [
              CircleAvatar(
                backgroundColor: scheme.secondaryContainer,
                child: Icon(Icons.sensors, color: scheme.onSecondaryContainer),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xs,
                  children: [
                    Text(
                      station.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      '${station.location} · ${station.lastUpdate}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: muted,
                    ),
                    Text('Батарея ${station.battery}%', style: muted),
                  ],
                ),
              ),
              StatusChip(isOnline: station.isOnline),
            ],
          ),
        ),
      ),
    );
  }
}
