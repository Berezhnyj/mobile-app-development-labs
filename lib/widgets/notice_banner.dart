import 'package:flutter/material.dart';
import 'package:flutter_lab1/theme/app_theme.dart';

/// Inline warning shown above content, e.g. when a station is offline.
class NoticeBanner extends StatelessWidget {
  const NoticeBanner({required this.message, super.key, this.icon});

  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: BorderRadius.circular(AppSpacing.radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Row(
          spacing: AppSpacing.m,
          children: [
            Icon(
              icon ?? Icons.warning_amber_rounded,
              color: scheme.onErrorContainer,
            ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: scheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
