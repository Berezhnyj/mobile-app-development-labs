import 'package:flutter/material.dart';

/// Text field with an icon; password fields get a visibility toggle.
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    required this.icon,
    super.key,
    this.hint,
    this.initialValue,
    this.keyboardType,
    this.isPassword = false,
  });

  final String label;
  final IconData icon;
  final String? hint;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool isPassword;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured = widget.isPassword;

  void _toggleVisibility() => setState(() => _obscured = !_obscured);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      obscureText: _obscured,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _toggleVisibility,
                tooltip: _obscured ? 'Показати пароль' : 'Сховати пароль',
                icon: Icon(
                  _obscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
    );
  }
}
