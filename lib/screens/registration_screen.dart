import 'package:flutter/material.dart';
import 'package:flutter_lab1/app_routes.dart';
import 'package:flutter_lab1/widgets/app_button.dart';
import 'package:flutter_lab1/widgets/app_text_field.dart';
import 'package:flutter_lab1/widgets/auth_layout.dart';
import 'package:flutter_lab1/widgets/auth_switch_link.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  void _register(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.main,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Реєстрація',
      subtitle: 'Створіть акаунт і підключіть першу метеостанцію',
      children: [
        const AppTextField(label: "Ім'я", icon: Icons.person_outline),
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
        const AppTextField(
          label: 'Повторіть пароль',
          icon: Icons.lock_reset,
          isPassword: true,
        ),
        AppButton(
          label: 'Створити акаунт',
          icon: Icons.person_add_alt_1,
          onPressed: () => _register(context),
        ),
        AuthSwitchLink(
          question: 'Вже маєте акаунт?',
          action: 'Увійти',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
