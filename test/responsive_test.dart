import 'package:flutter/material.dart';
import 'package:flutter_lab1/data/mock_data.dart';
import 'package:flutter_lab1/screens/login_screen.dart';
import 'package:flutter_lab1/screens/main_screen.dart';
import 'package:flutter_lab1/screens/registration_screen.dart';
import 'package:flutter_lab1/screens/station_details_screen.dart';
import 'package:flutter_lab1/screens/user_profile_screen.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';

/// Renders every screen on several device sizes.
/// A RenderFlex overflow is reported as an exception and fails the test.
void main() {
  const sizes = {
    'small phone 320x568': Size(320, 568),
    'iPhone 8 375x667': Size(375, 667),
    'large phone 430x932': Size(430, 932),
    'tablet portrait 768x1024': Size(768, 1024),
    'tablet landscape 1366x1024': Size(1366, 1024),
  };

  final screens = <String, Widget>{
    'LoginScreen': const LoginScreen(),
    'RegistrationScreen': const RegistrationScreen(),
    'MainScreen': const MainScreen(),
    'UserProfileScreen': const UserProfileScreen(),
    'StationDetailsScreen': StationDetailsScreen(
      station: MockData.stations.last,
    ),
  };

  for (final size in sizes.entries) {
    for (final screen in screens.entries) {
      testWidgets('${screen.key} has no overflow on ${size.key}', (
        tester,
      ) async {
        tester.view
          ..physicalSize = size.value
          ..devicePixelRatio = 1;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          MaterialApp(theme: AppTheme.light, home: screen.value),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
      });
    }
  }
}
