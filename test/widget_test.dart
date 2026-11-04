import 'package:flutter/material.dart';
import 'package:flutter_lab1/main.dart';
import 'package:flutter_lab1/screens/login_screen.dart';
import 'package:flutter_lab1/screens/main_screen.dart';
import 'package:flutter_lab1/screens/registration_screen.dart';
import 'package:flutter_lab1/screens/station_details_screen.dart';
import 'package:flutter_lab1/screens/user_profile_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> logIn(WidgetTester tester) async {
    await tester.pumpWidget(const MeteoApp());
    await tapAndSettle(tester, find.text('Увійти'));
  }

  testWidgets('starts on the login screen', (tester) async {
    await tester.pumpWidget(const MeteoApp());

    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('login opens the dashboard without a back button', (
    tester,
  ) async {
    await logIn(tester);

    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.byType(LoginScreen), findsNothing);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('registration opens from login and goes back', (tester) async {
    await tester.pumpWidget(const MeteoApp());

    await tapAndSettle(tester, find.text('Зареєструватися'));
    expect(find.byType(RegistrationScreen), findsOneWidget);

    await tapAndSettle(tester, find.text('Увійти'));
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('registration leads to the dashboard', (tester) async {
    await tester.pumpWidget(const MeteoApp());
    await tapAndSettle(tester, find.text('Зареєструватися'));

    await tapAndSettle(tester, find.text('Створити акаунт'));

    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.byType(RegistrationScreen), findsNothing);
  });

  testWidgets('station card opens station details', (tester) async {
    await logIn(tester);

    await tapAndSettle(tester, find.text('Дача'));

    expect(find.byType(StationDetailsScreen), findsOneWidget);
    expect(find.textContaining('Станція офлайн'), findsOneWidget);

    await tapAndSettle(tester, find.byType(BackButton));
    expect(find.byType(MainScreen), findsOneWidget);
  });

  testWidgets('profile opens from dashboard and logout returns to login', (
    tester,
  ) async {
    await logIn(tester);

    await tapAndSettle(tester, find.byTooltip('Профіль'));
    expect(find.byType(UserProfileScreen), findsOneWidget);

    await tapAndSettle(tester, find.text('Вийти'));
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });

  testWidgets('password visibility can be toggled', (tester) async {
    await tester.pumpWidget(const MeteoApp());

    await tapAndSettle(tester, find.byTooltip('Показати пароль'));

    expect(find.byTooltip('Сховати пароль'), findsOneWidget);
  });
}
