import 'package:flutter/material.dart';
import 'package:flutter_lab1/app_routes.dart';
import 'package:flutter_lab1/data/mock_data.dart';
import 'package:flutter_lab1/theme/app_theme.dart';
import 'package:flutter_lab1/widgets/app_button.dart';
import 'package:flutter_lab1/widgets/coming_soon.dart';
import 'package:flutter_lab1/widgets/info_tile.dart';
import 'package:flutter_lab1/widgets/page_body.dart';
import 'package:flutter_lab1/widgets/profile_header.dart';
import 'package:flutter_lab1/widgets/section_header.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    const user = MockData.user;
    void comingSoon() => showComingSoon(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Профіль')),
      body: PageBody(
        maxWidth: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(user: user),
            const SectionHeader(title: 'Особисті дані'),
            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Телефон',
                    value: user.phone,
                  ),
                  InfoTile(
                    icon: Icons.location_city,
                    label: 'Місто',
                    value: user.city,
                  ),
                  InfoTile(
                    icon: Icons.sensors,
                    label: 'Підключені станції',
                    value: '${MockData.stations.length}',
                  ),
                  InfoTile(
                    icon: Icons.event_outlined,
                    label: 'З нами з',
                    value: user.memberSince,
                  ),
                ],
              ),
            ),
            const SectionHeader(title: 'Налаштування'),
            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.notifications_outlined,
                    label: 'Сповіщення',
                    value: 'Різка зміна погоди, низький заряд',
                    onTap: comingSoon,
                  ),
                  InfoTile(
                    icon: Icons.straighten,
                    label: 'Одиниці виміру',
                    value: '°C, гПа, м/с',
                    onTap: comingSoon,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            AppButton(
              label: 'Редагувати профіль',
              icon: Icons.edit_outlined,
              onPressed: comingSoon,
            ),
            const SizedBox(height: AppSpacing.m),
            AppButton(
              label: 'Вийти',
              icon: Icons.logout,
              variant: AppButtonVariant.outlined,
              onPressed: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
