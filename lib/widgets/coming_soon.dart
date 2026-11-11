import 'package:flutter/material.dart';

/// Placeholder feedback for actions that need business logic.
void showComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      const SnackBar(content: Text('Буде доступно в наступних лабораторних')),
    );
}
