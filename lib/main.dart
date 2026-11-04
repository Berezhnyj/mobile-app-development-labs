import 'package:flutter/material.dart';
import 'package:flutter_lab1/app_routes.dart';
import 'package:flutter_lab1/theme/app_theme.dart';

void main() {
  runApp(const MeteoApp());
}

class MeteoApp extends StatelessWidget {
  const MeteoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Метеостанція',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
