import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed; // Nullable onPressed
  final String label;

  const SubmitButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              onPressed != null ? AppTheme.primaryColor : Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
