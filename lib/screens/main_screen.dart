import 'package:flutter/material.dart';
import 'package:flutter_lab1/app_routes.dart';
import 'package:flutter_lab1/data/mock_data.dart';
import 'package:flutter_lab1/models/weather_station.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_lab1/theme/responsive.dart';
import 'package:flutter_lab1/widgets/dashboard_overview.dart';
import 'package:flutter_lab1/widgets/page_body.dart';
import 'package:flutter_lab1/widgets/station_list.dart';

/// Dashboard: current weather, forecast, sensors and the station list.
/// On wide screens the station list moves into a second column.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _openStation(BuildContext context, WeatherStation station) {
    Navigator.pushNamed(context, AppRoutes.stationDetails, arguments: station);
  }

  @override
  Widget build(BuildContext context) {
    final stations = MockData.stations;
    final overview = DashboardOverview(
      conditions: MockData.current,
      hourly: MockData.hourly,
      readings: stations.first.readings,
    );
    final stationList = StationList(
      stations: stations,
      onStationTap: (station) => _openStation(context, station),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Метеостанція'),
        actions: [
          IconButton(
            tooltip: 'Профіль',
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
        ],
      ),
      body: PageBody(
        child: context.isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.l,
                children: [
                  Expanded(flex: 3, child: overview),
                  Expanded(flex: 2, child: stationList),
                ],
              )
            : Column(children: [overview, stationList]),
      ),
    );
  }
}
