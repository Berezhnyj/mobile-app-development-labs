import 'package:flutter/material.dart';

enum AppButtonVariant { filled, outlined }

/// Full-width button used for the main actions on every screen.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.variant = AppButtonVariant.filled,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final iconWidget = icon == null ? null : Icon(icon);
    final text = Text(label);

    return switch (variant) {
      AppButtonVariant.filled => FilledButton.icon(
        onPressed: onPressed,
        icon: iconWidget,
        label: text,
      ),
      AppButtonVariant.outlined => OutlinedButton.icon(
        onPressed: onPressed,
        icon: iconWidget,
        label: text,
      ),
    };
  }
}
