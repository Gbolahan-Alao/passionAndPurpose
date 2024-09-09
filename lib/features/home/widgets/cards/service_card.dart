// lib/features/auth/widgets/cards/service_card.dart

import 'package:flutter/material.dart';
import 'package:passion_purpose/core/theme/theme.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.primaryColor,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 122,
                fontWeight: FontWeight.bold,
                color: AppTheme.textColor),
          ),
        ),
      ),
    );
  }
}
