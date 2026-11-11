import 'package:flutter/material.dart';
import 'package:flutter_lab1/app_routes.dart';
import 'package:flutter_lab1/widgets/app_button.dart';
import 'package:flutter_lab1/widgets/app_text_field.dart';
import 'package:flutter_lab1/widgets/auth_layout.dart';
import 'package:flutter_lab1/widgets/auth_switch_link.dart';
import 'package:flutter_lab1/widgets/coming_soon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Вхід',
      subtitle: 'Увійдіть, щоб бачити дані своїх метеостанцій',
      children: [
        const AppTextField(
          label: 'Email',
          hint: 'name@example.com',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const AppTextField(
          label: 'Пароль',
          icon: Icons.lock_outline,
          isPassword: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => showComingSoon(context),
            child: const Text('Забули пароль?'),
          ),
        ),
        AppButton(
          label: 'Увійти',
          icon: Icons.login,
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AppRoutes.main),
        ),
        AuthSwitchLink(
          question: 'Немає акаунта?',
          action: 'Зареєструватися',
          onPressed: () => Navigator.pushNamed(context, AppRoutes.registration),
        ),
      ],
    );
  }
}
